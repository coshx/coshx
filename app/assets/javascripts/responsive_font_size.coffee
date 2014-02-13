calculatedFontSize = (full_screen_size, minimum_screen_size, max_font_size, min_font_size) ->
  ratio = ($(window).width() - minimum_screen_size) / (full_screen_size - minimum_screen_size)
  ratio = Math.max ratio, 0
  fontSize = min_font_size + (max_font_size-min_font_size) * ratio
  fontSize = Math.max fontSize, min_font_size
  fontSize = Math.min fontSize, max_font_size
  return fontSize

adjustFont = ->
  windowWidth = $(window).width()

  h1_font_size = calculatedFontSize 1200, 320, 42, 15
  h2_font_size = calculatedFontSize 1200, 320, 24, 12
  h3_font_size = calculatedFontSize 1200, 320, 30, 16
  h4_font_size = calculatedFontSize 1200, 320, 16, 10
  $("h1").css "font-size", h1_font_size + "px"
  $("h2").css "font-size", h2_font_size + "px"
  $("h3").css "font-size", h3_font_size + "px"
  $("h4").css "font-size", h4_font_size + "px"

  $("h4").css "line-height", Math.min(windowWidth * 0.006, 2)
  $("h2").css "line-height", Math.min(windowWidth * 0.006, 1.45)

  $("a#lets-work-together.btn.blue.small").css "font-size", h4_font_size + "px"
  $("a#lets-work-together.btn.blue.small").css "width", 130 + windowWidth * 0.1 + "px"
  $("a#lets-work-together.btn.blue.small").css "display", "block"

  if windowWidth > 767 #zurb mobile cutoff
    city_font_size = calculatedFontSize 1200, 767, 14, 12
    address_font_size = calculatedFontSize 1200, 767, 12, 8
    $("footer .city").css "font-size", city_font_size+'px'
    $("footer .address").css "font-size",  address_font_size+'px'
  else
    $("footer .city").css "font-size", '14px'
    $("footer .address").css "font-size",  '12px'

$(window).resize(adjustFont)
$(document).ready(adjustFont)
$(document).on('page:load', adjustFont)
$(document).on('page:restore', adjustFont)


