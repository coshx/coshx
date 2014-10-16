//post_preview.js
var postPreviewer = {
	update:function(e) {
		var date_today = new Date();
		if (e.target == postPreviewer.post_title) {
			postPreviewer.title.text(postPreviewer.assembleGoogleTitle(e.target.value));
			postPreviewer.url.text(postPreviewer.assembleUrl(e.target.value, date_today));
		} else if (e.target == postPreviewer.post_body) {
			postPreviewer.description.text(postPreviewer.assembleGoogleDescription(e.target.value,date_today));
		} else {
			console.log("that's weird... " + e.target);
		}
	},
	init:function() {
		postPreviewer.display = $('#post-preview-display');
		postPreviewer.title = $('#google-title');
		postPreviewer.description = $('#google-description');
		postPreviewer.url = $('#google-url');
		postPreviewer.post_title = document.getElementById("post_title");
		postPreviewer.post_body = document.getElementById("post_body");

		document.getElementById("post_title").addEventListener("input",postPreviewer.update);
		document.getElementById("post_body").addEventListener("input",postPreviewer.update);
	},
	assembleGoogleTitle:function(value) {
		return value + " - Coshx"
	},
	assembleUrl:function(value, date) {
		return "www.coshx.com/blog/"+ date.getFullYear() + "/" + date.getMonth() + "/" + date.getDate() + "/" + value.replace(/ /g,"-");
	},
	assembleGoogleDescription: function(value, date) {
		var short_value = "";
		if (value.length > 140) {
			short_value = value.substr(0,136) + " ...";
		} else {
			short_value = value;
		}
		return date.toDateString() + " - " + short_value;
	}
}

var ready;
ready = function() {
	if ($('#post_body').length > 0) {
        postPreviewer.init();
    }
}

$(document).ready(ready);
$(document).on('page:load',ready);