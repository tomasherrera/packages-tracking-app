$(document).ready -> 
  $('#states-of-country').change (e) ->
    cities_of_state = undefined
    input_state = undefined
    state = undefined
    input_state = $(this)
    cities_of_state = $('#cities-of-state')
    state = @options[e.target.selectedIndex].id
    if state == 'no-state'
      return cities_of_state.html('')
    else
      $.ajax
        url: '/cities/' + $(this).children(':selected').attr('id')
        success: (data) ->
          opt = undefined
          opt = '<option value="" selected>Select City</option>'
          if data.length == 0
          else
            data.forEach (i) ->
              opt += '<option value="' + i + '" id="' + i + '">' + i + '</option>'
              return
            cities_of_state.html opt
          return
  return