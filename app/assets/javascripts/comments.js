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
$(document).on('turbolinks:load', function () {
  $('form#new_comment').on("submit", function(e){
    e.preventDefault();

    let form = $(this)
    let actionLink = form.attr("action")
    let params = form.attr("action")
    
    console.log("I worked!");
    $.post(actionLink + "/create", params)

    .success(function(json){
      console.log(json)
    })
  });
})