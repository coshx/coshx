
mobileMenu =

  showMenu: ->
    $('nav ul').addClass('mobile-menu')
    $('body').addClass('mobile-menu')
    $('section.feature').addClass('mobile-menu')
    $('#map-container').addClass('mobile-menu')
    @menuShown = true

  hideMenu: ->
    $('nav ul').removeClass('mobile-menu')
    $('body').removeClass('mobile-menu')
    $('section.feature').removeClass('mobile-menu')
    $('#map-container').removeClass('mobile-menu')
    @menuShown = false

  toggleMenu: ->
    if !@menuShown
      @showMenu()
    else
      @hideMenu()
    flyingHeader.position()

  init: ->
    @content = $("#content")
    @hideMenu()

flyingHeader =

  position: ->
    scroll_top = $(window).scrollTop()
    mobileMenuVisible = $("body").hasClass("mobile-menu")
    if scroll_top > @sticky_navigation_offset_top or mobileMenuVisible
      $(".sticky-header").css
        position: "fixed"
        top: 0
        left: 0
      $("#map-container").css "z-index": 1
    else
      $(".sticky-header").css
        position: "absolute"
        bottom: 0
        top: "auto"
      $("#map-container").css "z-index": -1

  init:->
    @sticky_navigation_offset_top = $(".sticky-header").offset().top


load = ->
  mobileMenu.init()
  $(".burger").click ->
    mobileMenu.toggleMenu()
  flyingHeader.init()
  $(window).scroll ->
    flyingHeader.position()

$(document).ready(load)
$(document).on('page:load', load)

