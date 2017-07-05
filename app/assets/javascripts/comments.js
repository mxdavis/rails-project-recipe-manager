var c 

class Comment {
  constructor(rating, description, recipeId, userId, id) {
    this.rating = rating
    this.description = description
    this.recipeId = recipeId
    this.userId = userId
    this.id = id
  }
}

Comment.prototype.displayComment = function(){
  
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
      c.displayComment()
    })
    .error(function(response){
      
    })
  });
})