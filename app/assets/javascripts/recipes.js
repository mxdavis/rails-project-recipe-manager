var title
var r

class Recipe {
  constructor(recipeId, name, timeInMinutes, instructions, userId, favoriteId, template) {
    this.recipeId = recipeId
    this.name = name
    this.timeInMinutes = timeInMinutes
    this.instructions = instructions
    this.userId = userId
    this.favoriteId = favoriteId
    this.template = template
  }
}

Recipe.prototype.returnRecipeHtml = function(){
  var source   = $("#recipe-template").html();
  var template = Handlebars.compile(source);
  var context = {
    recipeId: r.recipeId,
    name: r.name,
    timeInMinutes: r.timeInMinutes,
    instructions: r.instructions,
    userId: r.userId,
  };
  r.template = template(context);
  $('#list-recipes').append(r.template)
}

var createRecipes = recipes => {
  recipes.data.forEach(function(recipe) {
    r = new Recipe(recipe.id, recipe.attributes.name, String(recipe.attributes["time-in-minutes"]), recipe.attributes.instructions, recipe.relationships.user.data.id, recipe.relationships.favorites.data)
    r.returnRecipeHtml()
  })
}
$(document).on("click", "#sort-recipes-by", function(e){
  var url = e.target.href
  title = `<h1>${e.target.text}</h1>`
  $('#list-recipes').html("")
  $('#list-recipes').append(title)
  $.get(url, function(recipes){
    createRecipes(recipes)
    })
  e.preventDefault()
})
