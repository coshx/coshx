function imgurUploadFeature() {
	var area = $('#post_body')[0];
    var imgurIndicator = $('#uploadIndicator');
    var supportIndicator = $('#supportIndicator');
    var supported = true;

    var tests = {
        filereader:typeof FileReader != 'undefined',
        dnd:'draggable' in document.createElement('textarea'),
        formdata:!!window.FormData
    }

    function testSupport() {
        "filereader formdata".split(' ').forEach(function(api) {
            if (tests[api] === false) {
                supported = false;
                console.log(api)
            } 
        });
        if (!supported) {
            supportIndicator.css("color","#E04C7E");
            supportIndicator.text("Sorry, dragging images into here is not currently supported. Post them manually to ")
        }
    }

    function readFiles(files) {
        var fr = new FileReader();
        fr.onload = function(event) {
            var Tresult = event.target.result;
            var datatype = Tresult.slice(Tresult.search(/\:/)+1,Tresult.search(/\;/));
            var blob = Tresult.replace(/^data\:image\/\w+\;base64\,/, '');
            $.ajax({
                type:"POST",
                data:{
                    file:blob,
                    mimeType: datatype,
                    extension:datatype.slice(datatype.search(/\//)+1)
                },
                url:'../uploads/images',
                success:function(msg) {
                    handleStatus(msg,"success");
                },
                error:function(errormsg) {
                    handleStatus(errormsg,"error");
                }
            });

        }
        fr.readAsDataURL(files[0]);
    }

    function handleStatus(msg,type) {
        if (type === "success") {
            imgurIndicator.css("color","#85bf25");
            area.value += "<img src='"+msg+"'>";
        }
        if (type === "error") {
            imgurIndicator.css("color","#E04C7E");
            console.log(msg);
            alert("Sorry, there was an error with your request:" + msg);
        }
    }

    area.ondragover = function(e) {
        e.stopPropagation();
        e.preventDefault();
        $(this).addClass('hover');
    }
    area.ondragend = function(e) {
        e.stopPropagation();
        e.preventDefault();
        $(this).removeClass('hover');
    }
    area.ondrop = function(e) {
        if ($(this).hasClass('hover')) $(this).removeClass('hover')
        e.stopPropagation();
        e.preventDefault();
        console.log(e.dataTransfer.files);
        readFiles(e.dataTransfer.files);
    }
    testSupport();
}
$(document).ready(function() {
	if ($('#post_body').length > 0) {
		imgurUploadFeature();
        console.log("Document ready");
	}
})
function dataURItoBlob(dataURI, dataType) {
    var binary = atob(dataURI.split(',')[1]);
    var array = [];
    for(var i = 0; i < binary.length; i++) {
        array.push(binary.charCodeAt(i));
    }
    return new Blob([new Uint8Array(array)], {type: dataType});
}