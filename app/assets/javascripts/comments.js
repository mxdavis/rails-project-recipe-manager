"use strict";

var c;

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
  $('div#show-comments').append(c.template)
  $('input#comment_rating').val("")
  $('input#comment_description').val("")
}

var postForm = function (form){
  let actionLink = form.attr("action")
  let params = form.serialize()
  
  $.post(actionLink, params)
  .success(function(json){
    c = new Comment(json.rating, json.description, json.recipe.id, json.user.id, json.user.name, json.id)
    c.returnCommentHtml()
  })
  .error(function(response){
    $('div#comments').before("there has been an error, try again")
  })  
}

var deleteComment = function(currentComment){
  $.ajax({
    url: currentComment.href,
    type: 'DELETE',
    success: function(result) {
    },
    error: function(result){
      "something went wrong" + result
    }
});
}


$(function() {
  $('form#new_comment').on("submit", function(e){
    e.preventDefault();
    var form = $(this)
    postForm(form)
  });
})

$(document).on("click", 'a.dcomment', function(event){
  var currentComment = this
  event.preventDefault();
  currentComment.parentElement.remove()
  deleteComment(currentComment)
  
})