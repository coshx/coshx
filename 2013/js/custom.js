
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
	$('.contact-link').on({
		click: function (e) {
			e.preventDefault();
			var id = $(this).attr('rel');
			$('#' + id).reveal();
		}
	});

	$('.window').on({
		mouseenter: function () {
			$('.expand', this).animate({
				'bottom': 0
			}, 200);
		},
		mouseleave: function () {
		$('.expand', this).animate({
				'bottom': -55
			}, 200);
		}
	});
	
	$('.expand').on({
		click: function (e) {
			e.preventDefault();
			imgHeight = $('#case-study-image').height();
			imgHeight += 290; // add in the padding at the top of the div
			imgHolder = $(this).parent();
			if($(imgHolder).hasClass('expanded')){
				$(window).scrollTo(0, {duration: 1500});
				$(imgHolder).animate({
					'height': 655
				}, 1500, function(){
					$('.expand', this).html('Expand to full view');
					$(this).removeClass('expanded');
				});
			}
			else{
				$(imgHolder).animate({
					'height': imgHeight
				}, 1500, function(){
					$('.expand', this).html('close');
					$(this).addClass('expanded');
				});
			}
		}
	});
});
