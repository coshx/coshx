
function getCookie(c_name)
{
var i,x,y,ARRcookies=document.cookie.split(";");
for (i=0;i<ARRcookies.length;i++)
  {
  x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
  y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
  x=x.replace(/^\s+|\s+$/g,"");
  if (x==c_name)
    {
    return unescape(y);
    }
  }
}

function setCookie(c_name,value,exdays)
{
var exdate=new Date();
exdate.setDate(exdate.getDate() + exdays);
var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
document.cookie=c_name + "=" + c_value;
}

function checkCookie()
{
	setCookie("username","Steve", 0);	
	
// var username=getCookie("username");
// if (username!=null && username!="")
//   {
//   alert("Welcome again " + username);
//   }
// else
//   {
//   username=prompt("Please enter your name:","");
//   if (username!=null && username!="")
//     {
//     setCookie("username",username);
//     }
//   }
}

checkCookie();

var locations = Array();
var map; 
locations['boulder'] = {'lat': 40.02909, 'lng': -105.25248 };
locations['charlottesville'] = {'lat': 38.02745, 'lng': -78.47101 };
locations['sanfrancisco'] = {'lat': 37.78182, 'lng': -122.40833 };

function shuffle(v){
    for(var j, x, i = v.length; i; j = parseInt(Math.random() * i), x = v[--i], v[i] = v[j], v[j] = x);
    return v;
}

function preload(arrayOfImages) {
    $(arrayOfImages).each(function(){
        $('<img/>')[0].src = this;
    });
}

function initialize()
{			
	var latlng = new google.maps.LatLng(39.9, -101.5);	
	var myOptions = {
		zoom: 5,
		center: latlng,
		mapTypeId: google.maps.MapTypeId.ROADMAP,
		disableDefaultUI: true,
		draggable: false,
		scrollwheel: false
	};
	map = new google.maps.Map(document.getElementById("map-canvas"),
		myOptions);

	var pos_boulder  = new google.maps.LatLng(locations['boulder'].lat, locations['boulder'].lng);
	var pos_charlottesville  = new google.maps.LatLng(locations['charlottesville'].lat, locations['charlottesville'].lng);
	var pos_sanfrancisco  = new google.maps.LatLng(locations['sanfrancisco'].lat, locations['sanfrancisco'].lng);
	
	var marker_boluder = new google.maps.Marker({
		position: pos_boulder,            
		map: map,
		icon: "img/map_marker.png"
	});
	var marker_charlottesville = new google.maps.Marker({
		position: pos_charlottesville,            
		map: map,
		icon: "img/map_marker.png"
	});
	var marker_sanfrancisco = new google.maps.Marker({
		position: pos_sanfrancisco,            
		map: map,
		icon: "img/map_marker.png"
	});
}

function toggleLabel() {
	var input = $(this);
	setTimeout(function() {
		var def = input.attr('title');
		if (!input.val() || (input.val() == def)) {
			input.prev('span').css('visibility', '');
			if (def) {
				var dummy = $('<label></label>').text(def).css('visibility','hidden').appendTo('body');
				input.prev('span').css('margin-left', dummy.width() + 3 + 'px');
				dummy.remove();
			}
		} else {
			input.prev('span').css('visibility', 'hidden');
		}
	}, 0);
};

function resetField() {
	var def = $(this).attr('title');
	if (!$(this).val() || ($(this).val() == def)) {
		$(this).val(def);
		$(this).prev('span').css('visibility', '');
	}
};

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

	$('#content-wrapper').on({
		mouseenter: function () {
			$('.overlay', this).fadeIn();
		},
		mouseleave: function () {
			$('.overlay', this).fadeOut();
		}
	}, '.team-mate a, .project a');

	$('.contact-link').on({
		click: function (e) {
			e.preventDefault();
			var id = $(this).attr('rel');
			$('#' + id).reveal();
		}
	});

	$("#content-wrapper").on({
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
	}, ".window");

	$('#content-wrapper').on({
		mouseenter: function(){
			rel = $(this).attr('rel');			
			var newClasses = 'well row ' + rel;
			$('.well').attr('class', newClasses);
			servicesText = $(".services-text > li[rel='" + rel +  "']").html();			
			$('#services-message').html(servicesText);			
		}
	}, '.ring');

	$('input, textarea').on('keydown', toggleLabel);
    $('input, textarea').on('paste', toggleLabel);
    $('select').on('change', toggleLabel);

	$('#content-wrapper').on({
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
	}, '.expand');

	var shownAboutSection = false;
	var shownTeamSection = false;
	function displayImages() {
		var teamMates = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
		teamMates = shuffle(teamMates);
		var t = $('.team-mate');
		i = 0;
		t.eq(teamMates[i++]).fadeIn(200, displayImages);
	}

	$('#content-wrapper').on({
		inview: function(event, visible) {
					if (visible && !shownAboutSection) 
					{
						var teamMates = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
						teamMates = shuffle(teamMates);
						var t = $('.team-mate');
						i = 0;
						shownAboutSection = true;
						(function displayImages() {
							$('.team-mate:eq(' + teamMates[i++] + ')')
							.css('visibility','visible')
							.hide()
							.fadeIn(100, displayImages);
						})();
					}
				}
			}
		, '#team-grid');

	$('#content-wrapper').on({
		inview: function(event, visible) {
			if (visible && !shownTeamSection) 
			{
				var projects = [0, 1, 2, 3, 4, 5, 6, 7, 8];
				projects = shuffle(projects);
				x = 0;
				shownTeamSection = true;
				(function displayImages() {
					$('.project:eq(' + projects[x++] + ')')
					.css('visibility','visible')
					.hide()
					.fadeIn(100, displayImages);
				})();
			}
		} 
	}, '#projects-grid');

	$('.team-mate a').on('click', function(e){
		//e.preventDefault();
	});
    
    $('.addresses li a').on('click', function(e){    	
    	e.preventDefault();
    	var l = $(this).attr('rel');
    	$('.addresses li a').removeClass('selected');
    	$(this).addClass('selected');
    	var latlng = new google.maps.LatLng(locations[l].lat, locations[l].lng);
    	map.panTo(latlng);
    	map.setZoom(16);

    });

	$(window).on("hashchange", function(e){
		if ( window.location.hash == "#home" && (!url || url == "#")) return false;
		url = window.location.hash || "#home";
		var homeSections = ['about', 'projects'];
		url=url.replace('#','');
		scroll = '';
		if(homeSections.indexOf(url) != -1)
		{
			scroll = url;
			url = 'home';			
		}
		
		$('#content-wrapper').removeClass('fadeOut').removeClass('fadeIn');

		$.ajax({
			url: 'loadpage.php',
			type: 'POST',
			dataType: 'html',
			data: {url: url},
			success: function(data, textStatus, xhr) {
				if(url === 'home')
				{
					shownTeamSection = false;
					shownAboutSection = false;
				}
				
				$('#content-wrapper').addClass('fadeOut');

				setTimeout(function(){
					$.scrollTo(0);
					$('#content-wrapper').toggleClass('fadeOut').toggleClass('fadeIn');
					$('#content-wrapper').html(data);
					if(scroll !== ''){
						$('nav ul li a').removeClass('active');
						$('a[rel='+ scroll + ']').addClass('active');
						$(window).scrollTo('#' + scroll, {offset: {top:-140},});
					}
				}, 600);

			}
		});
	});
	
	preload([
	    'img/employees/davekapp-avatar.png',
	    'img/employees/bentaitelbaum-avatar.png',
	    'img/employees/calvindelamere-avatar.png',	    
	    'img/employees/davidkovsky-avatar.png',	    
	    'img/employees/gabekopley-avatar.png',	    
	    'img/employees/test-graph.png',	    
	    'img/folio-test.png'
	]);

	window.location.hash == "" || window.location.hash == "#" || window.location.hash == "#home" || $(window).trigger("hashchange");

	function waitForIt(el, callback){
		el.on("mozAnimationEnd webkitAnimationEnd msAnimationEnd oAnimationEnd animationend mozAnimationEnd", callback);
	} 
	
	waitForIt($("#site-loader"), function(){		
		$("#logo").removeClass("paused");
	});

	waitForIt($("#logo"), function(){	

		$("nav").removeClass("paused");
		$("#content-wrapper").removeClass("paused");
		$(".contact-info").removeClass("paused");
	});

});
