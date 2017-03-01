$(document).on "turbolinks:load", ->

  # Hide all elements
  $('#home-bg').hide()
  $('#little-logo').hide()
  $('#home-info')
    .find('h1,svg,p')
    .hide()
  $('#large-logo').hide()
  $('#home-buttons div').hide()

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

  showHome = ->
    $('#home-bg')
      .velocity("transition.slideUpIn")
    $('#little-logo')
      .delay(100)
      .velocity("transition.slideDownIn")
    $('#large-logo')
      .delay(100)
      .velocity("transition.slideDownIn")
    $('#home-info')
      .delay(200)
      .find('h1,svg,p')
      .velocity("transition.slideLeftIn", { stagger: 100, duration: 300 })
    $('#home-buttons div')
      .delay(500)
      .velocity("transition.slideUpIn", { duration: 200, stagger: 100 })


  fillScreen = ->
    $('#preloader')
      .fadeIn()
      .addClass('fill-screen')
    $('#overlay')
      .delay(1000)
      .velocity({opacity: 0}, {complete: showHome })

  $('#preloader div')
    .delay(500)
    .velocity({opacity: 0}, {complete: fillScreen })

  # $('#home-bg')
  #   .delay(3000)
  #   .velocity("transition.slideUpIn");
