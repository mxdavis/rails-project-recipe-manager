class RecipesController < ApplicationController

  def home
    @recipes = Recipe.newest(5)
    @favorites = Favorite.top_favorited(3)
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def sorted_favorite
    @favorites = Favorite.top_favorited
    @sort_kind = "All Recipes sorted by the most favorite ones"
    render 'recipes'
  end

  def sorted_cook_time
    @recipes = Recipe.fastest
    @sort_kind = "All Recipes From Fastest to Slowest"
    render 'recipes'
  end

  def sorted_newest
    @recipes = Recipe.newest
    @sort_kind = "All Recipes From Newest to Oldest"
    render 'recipes'
  end
end
