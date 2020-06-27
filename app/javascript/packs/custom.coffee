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
