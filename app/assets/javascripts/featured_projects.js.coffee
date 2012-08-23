# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
  
  $('.featured_projects img').hover(
    -> $(".overlay", this).stop().animate({top:'0px'},{queue:false,duration:300})
    -> $(".overlay", this).stop().animate({top:'-183px'},{queue:false,duration:300})
  )
