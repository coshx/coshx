# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$("document").ready ->
  $(".point1").popover
    placement: "right"
    content: "We have the technical expertise to make your ideas become an amazing reality."

  $(".point2").popover
      placement: "right"
      content: "Our experience with Agile development techniques means you'll spend more time loving your product and less time in meetings."

  $(".point3").popover
      placement: "right"
      content: "We have a combined total of over 100,000 man-hours of development experience. Regardless of what you need, we can help."

  $(".point4").popover
      placement: "right"
      content: "With team members that are experienced at working at every type of business - from spry startups to large enterprises - we are able to adapt to any situation quickly."

  $('#footer-nav').localScroll()

  $('ul.portfolio-thumbs li').hover(
    -> $(".overlay", this).stop().animate({top:'0px'},{queue:false,duration:300})
    -> $(".overlay", this).stop().animate({top:'-183px'},{queue:false,duration:300})
  )