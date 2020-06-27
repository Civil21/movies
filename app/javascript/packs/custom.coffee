
console.log 'Hello world from coffeescript'

export select_sort=(object) ->
  console.log(object)
  $.ajax
    url: '/'
    type: 'GET'
    dataType: 'json'
    data:
      sort: $(object).val()
    success: (data)->
      console.log(data)
      $("#movies").html(data)
