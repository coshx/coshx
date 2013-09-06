window.Coshx ||= {}

header = Coshx.header =

  showMenu: ->
    @content.animate
      paddingTop: 150
    $('nav ul').addClass('mobile')
    @menuShown = true

  hideMenu: ->
    $('nav ul').removeClass('mobile')
    @content.animate
      paddingTop: 0
    @menuShown = false

  toggleMenu: ->
    if !@menuShown
      @showMenu()
    else
      @hideMenu()

  init: ->
    @content = $("#content")
    @hideMenu()

$(document).on 'page:load', ->
  header.init()
  $(".burger").click ->
    header.toggleMenu()
