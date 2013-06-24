/*$(document).ready(function() {
	if ($('.bluu').length > 0) {
		
	}
});*/
function validateEmail(email) { 
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;  
	return re.test(email);
}
function validate_contact() {
	name = $("#contact-form #message_name").val();
	email = $("#contact-form #message_email").val();
	var result = 1;
	if (name == "") {
		$("#contact-form .name .field-comment").fadeIn(500);
		$("#contact-form .name .field-comment").effect("shake", { times:3 }, 150);
		result = 5;
	} else {
		$("#contact-form .name .field-comment").fadeOut(500);
	} 
	if (!validateEmail(email)) {
		$("#contact-form .email .field-comment").fadeIn(500);
		$("#contact-form .email .field-comment").effect("shake", { times:3 }, 150);
		result = 5;
	} else {
		$("#contact-form .email .field-comment").fadeOut(500);
	}
	return result;  
}
function validate_quote() {
	name = $("#quote-form #message_name").val();
	email = $("#quote-form #message_email").val();
	var result = 1;
	if (name == "") {
		$("#quote-form .name .field-comment").fadeIn(500);
		$("#quote-form .name .field-comment").effect("shake", { times:3 }, 150);
		result = 5;
	} else {
		$("#quote-form .name .field-comment").fadeOut(500);
	} 
	if (!validateEmail(email)) {
		$("#quote-form .email .field-comment").fadeIn(500);
		$("#quote-form .email .field-comment").effect("shake", { times:3 }, 150);
		result = 5;
	} else {
		$("#quote-form .email .field-comment").fadeOut(500);
	}
	if (result == 5) {
		$(".quote-slide").hide();
		$(".slide1").show().addClass('active');
	}
	return result;  
}