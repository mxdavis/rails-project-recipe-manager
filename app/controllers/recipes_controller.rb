class RecipesController < ApplicationController

  def home
    @recipes = Recipe.limit(5)
    @favorites = Favorite.top_favorited(3)
  end
end
