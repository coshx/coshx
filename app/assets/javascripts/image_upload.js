var imageUpload = {
    area: null,
    fileselect: null,
    filereader: null,
    form_dialog: null,
    init:function() {
        imageUpload.area = $('#post_body')[0];
        imageUpload.fileselect = $('#files')[0];
        imageUpload.filereader = new FileReader();
        imageUpload.area.ondrop = function(e) {
            e.stopPropagation();
            e.preventDefault();
            console.log(e);
            imageUpload.readFiles(e.dataTransfer.files);
        }
        imageUpload.area.ondragover = function(e) {
            e.stopPropagation();
            e.preventDefault();
            console.log(e.dataTransfer.dropEffect);
            e.dataTransfer.dropEffect = 'copy';
        }
        imageUpload.fileselect.onchange = function(e) {
            imageUpload.readFiles(e.target.files);
        }
        imageUpload.form_dialog = $( "#dialog-form" ).dialog({
            autoOpen: false,
            width: 350,
            modal: true,
            buttons: {
                "Place the image": imageUpload.createAndPlaceImage,
                Cancel: function() {
                    imageUpload.form_dialog.dialog("close");
                }
            },
            close: function() {
                imageUpload.formReset();
            }
        });
    },
    readFiles:function(files) {
        imageUpload.filereader.onload = function(event) {
            var event_result = event.target.result;
            var datatype = event_result.slice(event_result.search(/\:/)+1,event_result.search(/\;/));
            var base64_data = event_result.replace(/^data\:image\/\w+\;base64\,/, '');
            var image_extension = datatype.slice(datatype.search(/\//)+1);
            $("#supportIndicator").text("Loading...");
            $.ajax({
                type:"POST",
                data:{
                    file: base64_data,
                    mimeType: datatype,
                    extension: image_extension
                },
                url:'/uploads/images',
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
                $('#supportIndicator').text("Loaded.");
                imageUpload.showModal(message);
                break;
            case 0:
                alert("Sorry, there was an error: " + message);
                break;
            default:
                console.log(status + "," + message);
        }
    },
    showModal: function(url) {
        $('#url').val(url);
        imageUpload.form_dialog.dialog("open");
    },
    createAndPlaceImage: function() {
        function createImageTag() {
            var imageTag = new Image();
            imageTag.src = $('#url').val();
            checkEmptyAndAssign(imageTag,["alt"],$('#alt_title').val());
            checkEmptyAndAssign(imageTag,["height"],$('#height').val());
            checkEmptyAndAssign(imageTag,["width"],$('#width').val());
            var paddingValueWithPixels = $("#padding").val() + "px"
            checkEmptyAndAssign(imageTag,["style","padding"],paddingValueWithPixels);
            imageTag.style.float = $('#float').val();
            return imageTag.outerHTML;
        }
        function createTitleMarkdown() {
            var titleTag = "#### " + $('#title').val() + "  \n";
            return titleTag;
        }
        function createDescriptionMarkdown() {
            var descriptionTag = "\n" + $('#description').val();
            return descriptionTag;
        }
        function appendItem(item) {
            imageUpload.area.value += item;
        }
        function isEmpty(item) {
            return item === ""
        }
        function checkEmptyAndAssign(object, properties, gate) {
            if (!isEmpty(gate)) {
                if (properties.length == 1) {
                    object[properties[0]] = gate;
                } else {
                    object[properties[0]][properties[1]] = gate;
                }
                console.log(true)
                return true;
            } else {
                console.log(false);
                return false;
            }
        }
        function checkEmptyAndPlace(action,args,gate) {
            if (!isEmpty(gate)) {
                action(args);
                return true;
            } else {
                return false;
            }
        }
        checkEmptyAndPlace(appendItem,createTitleMarkdown(),$('#title').val());
        appendItem(createImageTag());
        checkEmptyAndPlace(appendItem,createDescriptionMarkdown(),$('#description').val());
        imageUpload.fileselect.value = "";
        imageUpload.form_dialog.dialog("close");
        $('#supportIndicator').text("Finished.");
    },
    formReset:function() {
        var inputs = $('#imageset input');
        for (var i=0;i<inputs.length;i++) {
            inputs[i].value = ""
        }

    }
}
var ready;
ready = function() {
    if ($('#post_body').length > 0) {
        imageUpload.init();
    }
}

$(document).ready(ready);
$(document).on('page:load', ready);