set_quantity = (selector)->
  $(selector).on 'click', ->
    line_item = $(this).closest('.input-group')
    line_item_id = $(this).closest('.input-group').attr('id')
    quantity = line_item.attr('quantity')
    
    quantity = parseInt(quantity) + 1 if selector == '.fa-plus'
    quantity = parseInt(quantity) - 1 if selector == '.fa-minus'
      
    if quantity > 0
      $.ajax({
        url: '/line_items/' + line_item_id,
        type: "PUT",
        data: { line_item: {quantity: quantity}}        
      })      

$(document).on "turbolinks:load", ->
  set_quantity('.fa-plus')  
  set_quantity('.fa-minus')
 
  $(".quantity-input").on 'keypress', (e)->
    if(e.keyCode==13)
      line_item = $(this).closest('.input-group')
      line_item_id = $(this).closest('.input-group').attr('id')
      quantity = $(this).val()  
    
      $.ajax({
        url: '/line_items/' + line_item_id,
        type: "PUT",
        data: { line_item: {quantity: quantity}}        
      })
