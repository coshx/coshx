scroll_to_top = ->

  $(".scrollup").click ->
    $("html, body").animate
      scrollTop: 0
      , 600
    false


$(document).ready(scroll_to_top)
$(document).on('page:load', scroll_to_top)
