
jQuery(function(){
	$('#main-nav').localScroll({offset: {top:-140}, duration: 900 });
	$('#logo, #logo-light').localScroll({duration: 900 });
	$('.team-mate a, .project a').on({
		mouseenter: function () {
			$('.overlay', this).fadeIn();
		},
		mouseleave: function () {
			$('.overlay', this).fadeOut();
		}
	});
});
