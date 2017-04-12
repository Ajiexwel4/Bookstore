$(document).ready ->
  $('[data-toggle="tooltip"]').tooltip()

  $('.checkbox-icon').click ->
  	$('.shipping').toggle()