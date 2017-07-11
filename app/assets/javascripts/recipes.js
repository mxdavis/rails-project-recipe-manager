var title
var r

class Recipe {
  constructor(recipeId, name, timeInMinutes, instructions, userId, userName, template) {
    this.recipeId = recipeId
    this.name = name
    this.timeInMinutes = timeInMinutes
    this.instructions = instructions
    this.userId = userId
    this.userName = userName
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
    userName: r.userName
  };
  r.template = template(context);
  $('#list-recipes').append(r.template)
}

var createRecipes = recipes => {
  recipes.forEach(function(recipe) {
    r = new Recipe(recipe.id, recipe.name, String(recipe.time_in_minutes), recipe.instructions, recipe.user.id, recipe.user.name)
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
