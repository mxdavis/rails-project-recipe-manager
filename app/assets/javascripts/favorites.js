
$(document).on("click", "span.favorited", function(e){
  e.preventDefault()
  $.post(`/recipes/${recipeId}/unfavorite_recipe`, function(data) {
    }, this)

        this.children["0"].innerHTML = '<img src="/assets/heart.png" alt="Heart">'
})

$(document).on("click", "span.favorite", function(e){
  e.preventDefault()
  var recipeId = parseInt(e.target.parentNode.dataset.recipe)
  $.post(`/recipes/${recipeId}/favorite_recipe`, function(data) {
    }, this)
    this.children["0"].innerHTML = '<img src="/assets/heart-red.png" alt="Heart">'
})
