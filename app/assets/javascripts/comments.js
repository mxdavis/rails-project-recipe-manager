var c 

class Comment {
  constructor(rating, description, recipeId, userId, userName, id, template) {
    this.rating = rating
    this.description = description
    this.recipeId = recipeId
    this.userId = userId
    this.userName = userName
    this.id = id
    this.template = template
  }
}

Comment.prototype.returnCommentHtml = function(){
  var source   = $("#comment-template").html();
  var template = Handlebars.compile(source);
  var context = {
    rating: c.rating,
    description: c.description,
    recipeId: c.recipeId,
    userId: c.userId,
    userName: c.userName,
    id: c.id
  };
  c.template = template(context);
  $('div#comments').before(c.template)
  $('input#comment_rating').val("")
  $('input#comment_description').val("")
}

$(document).on('turbolinks:load', function () {
  $('form#new_comment').on("submit", function(e){
    e.preventDefault();

    let form = $(this)
    let actionLink = form.attr("action")
    let params = form.serialize()
    
    console.log("I worked!");
    $.post(actionLink, params)
    .success(function(json){
      c = new Comment(json.data.attributes["rating"], json.data.attributes["description"], json.data.relationships.recipe.data.id, json.data.relationships.user.data.id, json.included[0].attributes.name, json.data.id)
      c.returnCommentHtml()
    })
    .error(function(response){
      $('div#comments').before("there has been an error, try again")
    })
  });
})