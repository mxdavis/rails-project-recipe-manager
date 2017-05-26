class RecipesController < ApplicationController

  def home
    @recipes = Recipe.newest(5)
    @favorites = Favorite.top_favorited(3)
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end
end
