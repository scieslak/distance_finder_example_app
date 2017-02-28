$(document).on "turbolinks:load", ->

  $('#preloader').slideUp(2000)
  # Initialize Google Autocomplete.
  initAutocomplete = (element) ->
    $element = $('#' + element)

    # Prevent sending form by hiting enter when autocomplete is in use.
    $element.keydown (e) ->
      if e.which == 13 and $('.pac-container:visible').length
        return false

    # Instantiate Google Autocomplete
    $element.focusin ->
      auto = new google.maps.places.Autocomplete document.getElementById(element)

  initAutocomplete 'origin'
  initAutocomplete 'destination'
