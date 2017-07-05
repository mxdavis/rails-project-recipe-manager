var c 

class Comment {
  constructor(rating, description, recipeId, userId, id, template) {
    this.rating = rating
    this.description = description
    this.recipeId = recipeId
    this.userId = userId
    this.id = id
    this.template = template
  }
}

Comment.prototype.returnCommentHtml = function(){
  debugger
  var source   = $("#comment-template").html();
  var template = Handlebars.compile(source);
  var context = {rating: "MY rating", description: "description"};
  c.template = template(context);
  debugger
}

$(document).on('turbolinks:load', function () {
  $('form#new_comment').on("submit", function(e){
    e.preventDefault();

    let form = $(this)
    let actionLink = form.attr("action")
    let params = form.serialize()
    debugger
    
    console.log("I worked!");
    $.post(actionLink, params)
    .success(function(json){
      c = new Comment(json.data.attributes["rating"], json.data.attributes["description"], json.data.relationships.recipe.data.id, json.data.relationships.user.data.id, json.data.id)
      c.returnCommentHtml()
    })
    .error(function(response){
      
    })
  });
})