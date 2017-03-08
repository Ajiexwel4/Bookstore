jQuery ->
  $(".button_submit").live "click", (e) ->
    e.preventDefault()
    $("#form1").trigger "submit"
    $("#form2").trigger "submit"