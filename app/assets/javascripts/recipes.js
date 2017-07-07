var title

class Recipe {
  constructor(recipeId, userId, id) {
    this.recipeId = recipeId
    this.userId = userId
    this.id = id
  }
}

$(document).ready(function() {
    $('#sort-recipes-by').on("click", function (e) {
      var url = e.target.href
      title = e.target.text
      debugger
      var title
      $.get(url, function(recipes){
      //   $('#list-recipes').html(recipes)
        debugger

      })
      e.preventDefault()
  })
})