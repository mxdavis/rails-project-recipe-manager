class FavoritesController < ApplicationController

  def show
    favorite = Favorite.find_by(user: current_user, recipe: find_by_recipe_id)
    render json: favorite
  end

  def update
    if logged_in? 
      if params["id"] == ""
        favorite = Favorite.create(recipe: find_by_recipe_id, user: current_user)
        render json: favorite, status: 201
      else
        favorite = Favorite.find_by(recipe: find_by_recipe_id, user: current_user)
        favorite.delete
        render json: favorite, status: 201
      end
    else 
      flash["alert"] = "Please login to favorite recipes"
      redirect_back(fallback_location: root_path)
    end
  end
end
