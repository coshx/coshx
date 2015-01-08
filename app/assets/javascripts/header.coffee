
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

load = ->
  try
    mobileMenu.init()
    $(".burger").click ->
      mobileMenu.toggleMenu()
  catch err

$(document).on('page:change', load)

