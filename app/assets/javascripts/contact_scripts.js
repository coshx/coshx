$(document).ready(function() {
	if ($('#message-name').length > 0) enhanceSlides();
});
function enhanceSlides() {
	$('#message_name').focus().prev().css("color","#FFF");
    
    $(".next-link").click(function (e) {
      e.preventDefault();
      var currentSlide = extractSlideNum($('.quote-slide.active').attr('class'));
      var nextSlide = parseInt($(this).attr("data-slide"),10);
      findSlideWithNumber(currentSlide).fadeOut(function() {
        //$(".quote-slide").hide();
        $('.quote-slide.active').removeClass('active');
        findSlideWithNumber(nextSlide).fadeIn(function() {
          $(".slide" + nextSlide).addClass('active');
          currentSlide = nextSlide;
        });
      }); 
    });

    $('label').next().focus(function(e) {
      $(this).prev().css("color","#FFFFFF");
    });
    $('label').next().blur(function(e) {
      $(this).prev().css("color","#004264");
    });

    $(".submit-link").click(function (e) {
  		e.preventDefault();
  		if (validate_contact()==1) $("#contact-form").submit();
  	});

  	$(".quote-submit-link").click(function (e) {
      e.preventDefault();
      if (validate_quote() == 1) $("#quote-form").submit();
    });

    function findSlideWithNumber(num) {
   		return $('.slide'+num);
  	}

  	function extractSlideNum(slideClasses) {
    	var slidePos = slideClasses.search(/ slide/gi) + 6;
    	return parseInt(slideClasses.slice(slidePos,slidePos+1));
  	}

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
			$(".slide1").show();
		}
		return result;  
	}
}