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
    let params = form.serialize()
    debugger
    
    console.log("I worked!");
    $.post(actionLink, params)

//in case doesnt work use:
    // $.ajax({
    //   url: actionLink, 
    //   data: params, 
    //   dataType: "json",
    //   method: "POST" 
    // })
    .success(function(json){
      debugger
      console.log(json)
    })
    .error(function(response){
      
    })
  });
})