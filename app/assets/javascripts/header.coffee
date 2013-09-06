window.Coshx ||= {}

header = Coshx.header =

  showMenu: ->
    @body.animate
      marginLeft: -150
    @sideMenu.animate
      marginLeft: -150
    @sideMenu.css
      display: 'block'
    @menuShown = true

  hideMenu: ->
    @body.animate
      marginLeft: 0
    @sideMenu.animate
      marginLeft: 0
    , =>
      @sideMenu.css
        display: 'none'
    @menuShown = false

  toggleMenu: ->
    if !@menuShown
      @showMenu()
    else
      @hideMenu()

  init: ->
    @body = $(".body")
    @sideMenu =  $(".side-menu")
    setTimeout =>
      bodyHeight = $("body").height()
      console.log bodyHeight
      @sideMenu.height(bodyHeight)
    ,
      1000

$ ->
  header.init()
  $(".burger").click ->
    header.toggleMenu()
