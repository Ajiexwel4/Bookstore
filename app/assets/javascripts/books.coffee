set_quantity_for_book = (selector) ->
  $(selector).on 'click', ->
    quantity = $('.quantity-input').val()

    new_quantity = parseInt(quantity) + 1 if selector == '.increment'
    new_quantity = parseInt(quantity) - 1 if selector == '.decrement'
    $('.quantity-input').val(new_quantity) if new_quantity >= 1


$(document).on "turbolinks:load", ->
  set_quantity_for_book('.increment')
  set_quantity_for_book('.decrement')

  $('.more').click ->
    description = $('p.lead.small.line-height-2').text("<%= @book.description %>")
    console.log(description)
    
