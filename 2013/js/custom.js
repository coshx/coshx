
jQuery(function(){
	$('nav #main-nav').localScroll({
		offset: {top:-140},
		duration: 900,
		onBefore: function(e, obj){		
			var id = $(obj).attr('ID');
			$('nav ul li a').removeClass('active');
			$('a[rel='+ id + ']').addClass('active');
		}
	});

	$('#logo, #logo-light').localScroll({duration: 900,
		onBefore: function(e, obj){
			$('nav ul li a').removeClass('active');
		}});
	$('section').localScroll({offset: {top:-140}, duration: 900});
	$('.team-mate a, .project a').on({
		mouseenter: function () {
			$('.overlay', this).fadeIn();
		},
		mouseleave: function () {
			$('.overlay', this).fadeOut();
		}
	});

	$('.team-mate a').on({
		click: function (e) {
			e.preventDefault();
			var id = $(this).attr('rel');
			$('#' + id).reveal();
		}
	});
});
