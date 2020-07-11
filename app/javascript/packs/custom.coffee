console.log 'Hello world from coffeescript'
export select_sort=(object) ->
  $.ajax
    url: '/'
    type: 'GET'
    dataType: 'json'
    data:
      sort: $(object).val()
    success: (data)->
      $("#movies").html(data.html)
$(document).on "turbolinks:load", ->
  $("#raty").raty({
    path: "/",
    half: true,
    click: (score,erv) ->
      console.log score
      $("#review_rate")[0].value = score
    })
  $(".raty").raty({
    readOnly: true,
    path: "/",
    half: true,
    })
