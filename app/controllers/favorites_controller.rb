class FavoritesController < ApplicationController

  def show
    favorite = Favorite.find_by(user: current_user, recipe: find_by_recipe_id)
    render json: favorite
  end

  # def favorite
  #   if logged_in? 
  #     recipe = find_by_recipe_id
  #     favorite = Favorite.new(recipe: recipe, user: current_user)
  #     if favorite.save 
  #       render json: favorite, status: 201
  #       flash["notice"] = "You have favorited #{recipe.name}"
  #     else 
  #       flash["alert"] = "Something has gone wrong"
  #     end
  #   else 
  #     flash["alert"] = "Please login to favorite recipes"
  #   end
  #   redirect_back(fallback_location: root_path)
  # end

  # def unfavorite
  #   if logged_in? 
  #     recipe = find_by_recipe_id
  #     favorite = Favorite.find_by(recipe: recipe, user: current_user)
  #     favorite.delete
  #     respond_to do |format|
  #       format.json { render json: favorite }
  #     end
  #     flash["notice"] = "You have unfavorited #{recipe.name}"
  #   else 
  #     flash["alert"] = "Please login to favorite recipes"
  #   end
  #   redirect_back(fallback_location: root_path)
  # end

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
