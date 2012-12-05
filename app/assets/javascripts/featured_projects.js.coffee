$(document).on "page:load", ->
  $('.featured_projects img').hover(
    -> $(".overlay", this).stop().animate({top:'0px'},{queue:false,duration:300})
    -> $(".overlay", this).stop().animate({top:'-183px'},{queue:false,duration:300})
  )
