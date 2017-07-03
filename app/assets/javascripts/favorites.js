class Favorite {
  constructor(id, user_id, recipe_id) {
    this.id = id;
    this.recipe_id = recipe_id;
    this.user_id = user_id;
  }
}

$(document).on("click", "span.favorites", function(e){
  e.preventDefault()
  debugger
  $.get('/users/1/recipes/1/favorites.json', function(data) {
    debugger
    new Favorite(data.id, data.attributes.recipe-id, data.attributes.user-id )
    }, this)
        debugger
})
