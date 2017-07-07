var title
var r

class Recipe {
  constructor(recipeId, name, timeInMinutes, instructions, userId, favoriteId) {
    this.recipeId = recipeId
    this.name = name
    this.timeInMinutes = timeInMinutes
    this.instructions = instructions
    this.userId = userId
    this.favoriteId = favoriteId
  }
}

Recipe.prototype.returnRecipeHtml = function(){
  var source   = $("#recipe-template").html();
  var template = Handlebars.compile(source);
  var context = {
    recipeId: recipeId,
    name: name,
    timeInMinutes: timeInMinutes,
    instructions: instructions,
    userId: userId,
    favoriteId: favoriteId
  };

  
var createRecipes = recipes => {
  recipes.data.forEach(function(recipe) {
    r = new Recipe(recipe.id, recipe.attributes.name, recipe.attributes["time-in-minutes"], recipe.attributes.instructions, recipe.relationships.user.data.id, recipe.relationships.favorites.data)
    addRecipeToView(r)
  end
  })
}

$(document).on("click", "#sort-recipes-by", function(e){
        var url = e.target.href
        title = e.target.text
        $.get(url, function(recipes){
          // $('#list-recipes').html(recipes)
          createRecipes(recipes)
          })
        e.preventDefault()
})
