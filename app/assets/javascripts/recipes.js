$(document).ready(function() {
    $('#sort-recipes-by').on("click", function (e) {
      var url = e.target.href
      $.get(url, function(response){
        $('#list-recipes').html(response)
      })
      e.preventDefault()
  })
})