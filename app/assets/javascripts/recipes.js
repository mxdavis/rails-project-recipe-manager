$(document).ready(function() {
    $('#sort-recipes-by').on("click", function (e) {
      debugger
      var url = e.target.href
      $.get(url, function(response){
        console.log(response)
        debugger
        $('#list-recipes').html("hello")
      })
      e.preventDefault()
  })
})