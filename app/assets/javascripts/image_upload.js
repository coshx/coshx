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
            var bsfData = event.target.result.slice(event.target.result.search(/\,/)+1,event.target.result.length);
            var dat = {
                image:bsfData,
                type:'base64'
            };
            $.ajax({
                type:"POST",
                data:dat,
                url:'https://api.imgur.com/3/image',
                headers: {
                    Authorization: "Client-ID 6e0f35eb9a323aa"
                },
                dataType: "json",
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
            area.value += "<img src='"+msg.data.link+"'>";
        }
        if (type === "error") {
            imgurIndicator.css("color","#E04C7E");
            console.log(msg);
            alert("Sorry, there was an error with your request:" + msg.responseText);
        }
    }

    area.ondragover = function(e) {
        e.preventDefault();
        $(this).addClass('hover');
    }
    area.ondragend = function(e) {
        e.preventDefault();
        $(this).removeClass('hover');
    }
    area.ondrop = function(e) {
        if ($(this).hasClass('hover')) $(this).removeClass('hover')
        e.preventDefault();
        readFiles(e.dataTransfer.files);
    }

    testSupport();
}
$(document).ready(function() {
	if ($('#post_body').length > 0) {
		imgurUploadFeature();
	}
})