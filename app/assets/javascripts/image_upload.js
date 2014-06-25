var imageUpload = {
    area: null,
    filereader: null,
    init:function() {
        imageUpload.area = $('#post_body')[0];
        imageUpload.filereader = new FileReader();
        imageUpload.area.ondrop = function(e) {
            e.stopPropagation();
            e.preventDefault();
            imageUpload.readFiles(e.dataTransfer.files);
        }
    },
    readFiles:function(files) {
        imageUpload.filereader.onload = function(event) {
            var event_result = event.target.result;
            var datatype = event_result.slice(event_result.search(/\:/)+1,event_result.search(/\;/));
            var base64_data = event_result.replace(/^data\:image\/\w+\;base64\,/, '');
            var image_extension = datatype.slice(datatype.search(/\//)+1)
            $.ajax({
                type:"POST",
                data:{
                    file: base64_data,
                    mimeType: datatype,
                    extension: image_extension
                },
                url:'../uploads/images',
                success:function(msg) {
                    imageUpload.handleStatus(msg,1);
                },
                error:function(errormsg) {
                    imageUpload.handleStatus(errormsg,0);
                }
            });
        }
        imageUpload.filereader.readAsDataURL(files[0]);
    },
    handleStatus: function(message,status) {
        switch (status) {
            case 1:
                imageUpload.area.value += '<img src="' + message + '">';
                break;
            case 0:
                alert("Sorry, there was an error: " + message);
                break;
            default:
                console.log(status + "," + message);
        }
    }
}

$(document).ready(function() {
	if ($('#post_body').length > 0) {
		imageUpload.init();
	}
})