$(document).on "turbolinks:load", ->

  # Hide all elements
  $('#home-bg').hide()
  $('#little-logo').hide()
  $('#home-info')
    .find('h1,svg,p')
    .hide()
  $('#large-logo').hide()
  $('#get-started').hide()
  $('#home').hide()

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

  # Fill screen green, fade out overlay and call showHome
  fillScreen = ->
    $('#preloader')
      .fadeIn()
      .addClass('fill-screen')
    $('#overlay')
      .delay(1000)
      .velocity({opacity: 0}, {complete: showHome })

  # Show homepage elements
  showHome = ->
    $('#overlay').hide()
    $('#home').show()
    $('#home-info')
      .find('h1,svg,p')
      .velocity("transition.slideLeftIn", { duration: 400, stagger: 200})
    $('#little-logo')
      .delay(600)
      .velocity("transition.slideDownIn", 400)
    $('#large-logo')
      .delay(600)
      .velocity("transition.slideDownIn", 400)
    $('#get-started')
      .delay(800)
      .velocity("transition.slideUpIn", 400)
    $('#home-bg')
      .delay(900)
      .velocity("transition.slideUpIn", 400)

  # Hide homepage elements
  hideHome = ->
    $('#home-bg')
      .velocity("transition.slideDownOut", 400)
    $('#get-started')
      .delay(200)
      .velocity("transition.slideDownOut", 400)
    $('#little-logo')
      .delay(400)
      .velocity("transition.slideUpOut", 400)
    $('#large-logo')
      .delay(400)
      .velocity("transition.slideUpOut", 400)
    $('#home-info p')
      .delay(600)
      .velocity("transition.slideRightOut", 400)
    $('#home-info svg')
      .delay(800)
      .velocity("transition.slideRightOut", 400)
    $('#home-info h1')
      .delay(1000)
      .velocity("transition.slideRightOut", 400)
    # $('#home')
    #   .delay(3000)
    #   .hide()

# Remove preloader dots and call fillScreen
  $('#preloader div')
    .delay(500)
    .velocity({opacity: 0}, {complete: fillScreen })

  $('#get-started').click(hideHome)
  $('#show-home').click(showHome)
