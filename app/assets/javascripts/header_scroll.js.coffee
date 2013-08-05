$(document).ready ->
  
  $(window).scroll ->
    height = $("body").height()
    scrollTop = $("body").scrollTop()
    opacity = 1
    
    opacity = 0.98 if scrollTop > 400
    
    $("#header").css "opacity", opacity
