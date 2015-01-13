mobileMenu =

  showMenu: ->
    $('body').addClass('mobile-menu')
    $('#header').addClass('mobile-menu')
    $('#nav ul').addClass('mobile-menu')
    $('#nav ul li').addClass('mobile-menu')
    $('#nav ul li a').addClass('mobile-menu')
    @menuShown = true

  hideMenu: ->
    $('body').removeClass('mobile-menu')
    $('#header').removeClass('mobile-menu')
    $('#nav ul').removeClass('mobile-menu')
    $('#nav ul li').removeClass('mobile-menu')
    $('#nav ul li a').removeClass('mobile-menu')
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
    $("#burger").click ->
      mobileMenu.toggleMenu()
  catch err

$(document).on('page:change', load)

