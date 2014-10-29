initialize = ->
  map_canvas = document.getElementById("map-canvas")
  return unless map_canvas
  map_options =
    center: new google.maps.LatLng(36.0403, -100.5463)
    zoom: 5
    mapTypeId: google.maps.MapTypeId.ROADMAP
    overviewMapControl: false
    mapTypeControl: false
    panControl: false
    rotateControl: false
    scaleControl: false
    streetViewControl: false
    zoomControl: false
    draggable: false
    scrollwheel: false
    styles: [ { "stylers": [ { "saturation": -100 } ] } ]

  map = new google.maps.Map(map_canvas, map_options)

  austin_marker = new google.maps.Marker (
	  position: new google.maps.LatLng(30.269038, -97.740344)
	  map: map
	  icon: "/assets/austin.png"
  )	

  cville_marker = new google.maps.Marker (
	  position: new google.maps.LatLng(38.028487, -78.471504)
	  map: map
	  icon: "/assets/charlottesville.png"
  )	

  sf_marker = new google.maps.Marker (
	  position: new google.maps.LatLng(37.782044, -122.408148)
	  map: map
	  icon: "/assets/san_francisco.png"
  )	


google.maps.event.addDomListener window, "load", initialize