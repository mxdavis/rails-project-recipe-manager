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
    this.ingredientId = ingredientId
    this.quantity = quantity
    this.template = template
  }
}

Recipe.prototype.ingredients = function (ingredients){
  //make array of ingredients and quantity handlebars can handle. Also need to get ingredient name by id,
  //may need to be a get request.
}

Recipe.prototype.returnAllRecipesHtml = function(){
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

Recipe.prototype.returnOneRecipeHtml = function(){
  var source   = $("#recipedetail-template").html();
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
    r.returnAllRecipesHtml()
  })
}

$(document).on("click", ".next_recipe", function(e){
  debugger
  var recipeId = parseInt(this.dataset.recipeid) + 1
   $.get("/recipes/" + recipeId +".json", function(recipe) {
     debugger
    r = new Recipe(recipe.id, recipe.name, String(recipe.time_in_minutes), recipe.instructions, recipe.user.id, recipe.user.name)
    r.ingredients(recipe.recipe_ingredients)
    })
    e.preventDefault()
})

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
