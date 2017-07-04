
$(document).on("click", "span.favorited", function(e){
  e.preventDefault()
  var recipeId = parseInt(e.target.parentNode.dataset.recipe)
  $.post(`/recipes/${recipeId}/unfavorite_recipe`)
  this.children["0"].innerHTML = '<img src="/assets/heart.png" alt="Heart">'
  this.className = "favorite"
})

$(document).on("click", "span.favorite", function(e){
  e.preventDefault()
  var recipeId = parseInt(e.target.parentNode.dataset.recipe)
  $.post(`/recipes/${recipeId}/favorite_recipe`)
    this.children["0"].innerHTML = '<img src="/assets/heart-red.png" alt="Heart">'
    this.className = "favorited"
})
