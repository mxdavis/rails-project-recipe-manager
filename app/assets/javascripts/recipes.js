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

Recipe.prototype.ingredients = function (ingredients){
  var source   = $("#recipeingredients-template").html();
  var template = Handlebars.compile(source);
  const ingredientList = template(ingredients)
  $('#recipe-detail-ingredients').html(ingredientList)
}

Recipe.prototype.comments = function (comments){
  var source   = $("#recipedetailcomments-template").html();
  var template = Handlebars.compile(source);
  const commentList = template(comments)
  $('#show-comments').html(commentList)
}

Recipe.prototype.commentForm = function(){
  var source   = $("#recipedetailscommentform-template").html();
  var template = Handlebars.compile(source);
  var context = {
    id: r.recipeId
  };
  r.template = template(context);
  $('#new_comment').html(r.template)
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

Recipe.prototype.recipeDetailHeaderHtml = function(){
  var source   = $("#recipedetailheader-template").html();
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
  $('#recipe-detail-header').html(r.template)
}

Recipe.prototype.recipeDetailBottomHtml = function(){
  var source   = $("#recipedetailsbottom-template").html();
  var template = Handlebars.compile(source);
  var context = {
    recipeId: r.recipeId,
    instructions: r.instructions,
  };
  r.template = template(context);
  $('#recipe-details-bottom').html(r.template)
}

var createRecipes = recipes => {
  recipes.forEach(function(recipe) {
    r = new Recipe(recipe.id, recipe.name, String(recipe.time_in_minutes), recipe.instructions, recipe.user.id, recipe.user.name)
    r.returnAllRecipesHtml()
  })
}

$(document).on("click", ".next_recipe", function(e){
  var recipeId = parseInt(this.dataset.recipeid) + 1
   $.get("/recipes/" + recipeId +".json", function(recipe) {
    r = new Recipe(recipe.id, recipe.name, String(recipe.time_in_minutes), recipe.instructions, recipe.user.id, recipe.user.name)
    r.recipeDetailHeaderHtml()
    r.ingredients(recipe.formatted_ingredients)
    r.recipeDetailBottomHtml()
    r.comments(recipe.formatted_comments)
    r.commentForm(recipe)
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
