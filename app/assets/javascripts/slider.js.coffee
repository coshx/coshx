sliderNav = ->
  w = $("body .row:first-child").width()
  b = $("body").width()
  $(".slider-nav .left").stop().animate
    left: -1 * Math.floor((b - w) / 2)
  , 1500
  $(".slider-nav .right").stop().animate
    right: -1 * Math.floor((b - w) / 2)
  , 1500

$(document).ready ->
  $orbit = $("div.orbit")
  if $orbit.attr("data-change-url")
    slideChangeCallback = ->
      $(".slide").each (_, slide)->
        if $(slide).css("zIndex") == "3"
          history.pushState null, "123", "" + $(slide).attr("id")

  $orbit.orbit
    animation: "horizontal-push" # fade, horizontal-slide, vertical-slide, horizontal-push
    animationSpeed: 800 # how fast animtions are
    timer: false # true or false to have the timer
    resetTimerOnClick: false # true resets the timer instead of pausing slideshow progress
    advanceSpeed: 4000 # if timer is enabled, time between transitions
    pauseOnHover: false # if you hover pauses the slider
    startClockOnMouseOut: false # if clock should start on MouseOut
    startClockOnMouseOutAfter: 1000 # how long after MouseOut should the timer start again
    directionalNav: true # manual advancing directional navs
    captions: true # do you want captions?
    captionAnimation: "fade" # fade, slideOpen, none
    captionAnimationSpeed: 800 # if so how quickly should they animate in
    bullets: false # true or false to activate the bullet navigation
    bulletThumbs: false # thumbnails for the bullets
    bulletThumbLocation: "" # location from this file where thumbs will be
    afterSlideChange: slideChangeCallback

  sliderNav()
  $(window).resize ->
    sliderNav()

  $("body").keydown (e) ->
    if e.keyCode is 37
      $(".slider-nav .left").click()
    else $(".slider-nav .right").click()  if e.keyCode is 39

  $("div.orbit").swipe
    swipeLeft: (event, direction, distance, duration, fingerCount) ->
      $(".slider-nav .right").click()
    swipeRight: (event, direction, distance, duration, fingerCount) ->
      $(".slider-nav .left").click()
    fallbackToMouseEvents: false
