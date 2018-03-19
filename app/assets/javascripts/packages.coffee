$(document).ready ->  
  @toggleDetails = (e, id) ->
    e.preventDefault()
    detailsDiv = $('.details-' + id)
    detailsDiv.toggleClass 'hidden'
    @loadDetailMap(id)
    return
  icon = "https://s3-us-west-2.amazonaws.com/tracking-app/Package+Icon+location.png"
  markers = [];

  @loadDetailMap = (id) ->
    detailLocation = 
      lat: parseFloat($('#hidden-lat-' + id).text())
      lng: parseFloat($('#hidden-lng-' + id).text())
    detailMap = new (google.maps.Map)(document.getElementById('map-' + id),
      zoom: 10
      center: detailLocation)
    @addMarker(detailLocation, detailMap)
    return

  @showMap = ->
    showLocation = 
      lat: parseFloat($('#hidden-lat').text())
      lng: parseFloat($('#hidden-lng').text())
    map = new (google.maps.Map)(document.getElementById('map'),
      zoom: 12
      center: showLocation)
    @addMarker(showLocation, map)
    return

  @editMap = ->
    editLocation = 
      lat: parseFloat($('#hidden-lat').val())
      lng: parseFloat($('#hidden-lng').val())
    editLocationMap = new (google.maps.Map)(document.getElementById('map-location'),
      zoom: 12
      center: editLocation)
    @addMarker(editLocation, editLocationMap)
    setMapOnAll = (map) ->
      i = 0
      while i < markers.length
        markers[i].setMap map
        i++
      return
    google.maps.event.addListener editLocationMap, 'click', (event) ->
      newMarker = new (google.maps.Marker)(
        position: event.latLng
        map: editLocationMap
        icon: icon)
      setMapOnAll(null)
      $('#hidden-lat').val () ->
        event.latLng.lat()
      $('#hidden-lng').val () ->
        event.latLng.lng()
      markers.push(newMarker);
      return
    return

  @addMarker = (coords, map) ->
    marker = new (google.maps.Marker)(
      position: coords
      map: map
      icon: icon)
    markers.push(marker);
    return

  if $('#map-location').length > 0
    @editMap()
    return
  if $('#map').length > 0
    @showMap()
    return
  return
  
