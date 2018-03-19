# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready -> 
  $('#truck-assigning').click (e) ->
    address = $('#receiver-address').val()
    if address.length == 0 
      alert("Address must be filled to load trucks for that area")
      e.stopPropagation()
      return
    trucks = $('#trucks')
    $('.modal-loading').removeClass 'hidden'
    $('.modal-success').addClass 'hidden'
    $('.modal-no-fleet').addClass 'hidden'
    $.ajax
      url: '/fetch_fleets/' + address
      success: (data) ->        
        $('.modal-success').removeClass 'hidden'
        $('.modal-loading').addClass 'hidden'
        console.log(data)
        opt = undefined
        opt = '<option value="" selected>Select Truck</option>'
        if data.length == 0
        else
          data.forEach (i) ->
            opt += '<option value="' + i.id + '" id="' + i.id + '">' + 'Truck #0' + i.id + '</option>'
            return
          trucks.html opt
        return
      error: (error) ->
        if error.status == 404
          $('.modal-loading').addClass 'hidden'
          $('.modal-no-fleet').removeClass 'hidden'
        else if error.status == 500
          $('#truckAssigning').modal('toggle');
          alert("Error: Check Address For Receiver")
        console.log(error.status)
  return