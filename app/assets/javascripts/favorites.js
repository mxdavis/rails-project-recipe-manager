
// $(document).on("click", "span.favorited", function(e){
//   e.preventDefault()
//   var recipeId = parseInt(e.target.parentNode.dataset.recipe)
//   $.post(`/recipes/${recipeId}/unfavorite_recipe`)
//   this.children["0"].innerHTML = '<img src="/assets/heart.png" alt="Heart">'
//   this.className = "favorite"
// })

// $(document).on("click", "span.favorite", function(e){
//   e.preventDefault()
//   var recipeId = parseInt(e.target.parentNode.dataset.recipe)
//   $.post(`/recipes/${recipeId}/favorite_recipe`)
//     this.children["0"].innerHTML = '<img src="/assets/heart-red.png" alt="Heart">'
//     this.className = "favorited"
// })
var f
var dom

class Favorite {
  constructor(recipeId, userId, id) {
    this.recipeId = recipeId
    this.userId = userId
    this.id = id
  }
  changeHeart(){
    if(this.id){
      return '<img src="/assets/heart.png" alt="Heart">'
    } else {
      return '<img src="/assets/heart-red.png" alt="Heart">'
    }
  }
  changeClass(){
    if(this.id){
      return 'favorites favorite'
    } else {
      return 'favorites favorited'
    }
  }
}


$(document).on("click", "span.favorites", function(e){
  e.preventDefault()
  dom = e
  var recipeId = parseInt(e.target.parentNode.dataset.recipe)
   $.get("/recipes/" + recipeId + "/favorite.json", function(favorite) {
      if (favorite == null){
        f = new Favorite(recipeId)
      }else{
        f = new Favorite(recipeId, favorite.data.attributes["user-id"], favorite.data.id)
      }
      dom.currentTarget.children["0"].innerHTML = f.changeHeart()
      dom.currentTarget.className = f.changeClass()

      $.post("/recipes/" + recipeId + "/favorite", f)

    });
})