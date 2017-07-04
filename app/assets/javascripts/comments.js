class Comment {
  constructor(rating, description, recipeId, userId, id) {
    this.rating = rating
    this.description = description
    this.recipeId = recipeId
    this.userId = userId
    this.id = id
  }
}

$(document).on("submit", "div.comment-form", function(e){
  console.log("I worked!");
  e.preventDefault();
});