$(document).on "turbolinks:load", ->
  $('#check').on 'click', ->
    $('#remove').attr('disabled', true)
    if this.checked
      $('#remove').attr('disabled', false)