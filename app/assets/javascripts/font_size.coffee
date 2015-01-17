calculatedFontSize = (full_screen_size, minimum_screen_size, max_font_size, min_font_size) ->
  ratio = ($(window).width() - minimum_screen_size) / (full_screen_size - minimum_screen_size)
  ratio = Math.max ratio, 0
  fontSize = min_font_size + (max_font_size-min_font_size) * ratio
  fontSize = Math.max fontSize, min_font_size
  fontSize = Math.min fontSize, max_font_size
  return fontSize

adjustFont = ->
  windowWidth = $(window).width()

  h1_font_size = calculatedFontSize 1200, 320, 42, 30
  h2_font_size = calculatedFontSize 1200, 320, 30, 25
  h3_font_size = calculatedFontSize 1200, 320, 26, 18
  h4_font_size = calculatedFontSize 1200, 320, 22, 16
  h5_font_size = calculatedFontSize 1200, 320, 16, 10

  $("h1").css "font-size", h1_font_size + "px"
  $("h2").css "font-size", h2_font_size + "px"
  $("h3").css "font-size", h3_font_size + "px"
  $("h4").css "font-size", h4_font_size + "px"
  $("h5").css "font-size", h5_font_size + "px"

  $("a#contact-us.btn.rounded").css "font-size", h4_font_size + "px"
  $("a#contact-us.btn.rounded").css "width", 130 + windowWidth * 0.1 + "px"
  $("a#contact-us.btn.rounded").css "display", "block"

$(window).resize(adjustFont)
$(document).ready(adjustFont)
$(document).on('page:load', adjustFont)
$(document).on('page:restore', adjustFont)


