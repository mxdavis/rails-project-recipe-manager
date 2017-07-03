class RecipesController < ApplicationController

  def home
    @recipes = Recipe.newest(5)
    @favorites = Favorite.top_favorited(3)
  end

  def new
    @recipe = Recipe.new
    @ingredients = 6.times.collect { @recipe.recipe_ingredients.build }
  end


  def create
    recipe = current_user.recipes.new(recipe_params)
    if recipe.save
      recipe.add_ingredients_to_recipe(recipe_ingredient_params)
      redirect_to recipe_path(recipe), notice: "Your recipe has successfully been added"
    else
      @recipe = Recipe.new
      redirect_to new_recipe_path, alert: recipe.errors.full_messages.each {|m| m}.join
    end
  end

  def edit
    @recipe = find_by_id(Recipe)
    @i = 3.times.collect { @recipe.recipe_ingredients.build }
  end

  def update
    recipe = find_by_id(Recipe)
    if recipe.update(recipe_params)
      recipe.add_ingredients_to_recipe(recipe_ingredient_params)
      redirect_to recipe_path(recipe), notice: "Your recipe has successfully been updated"
    else 
      redirect_to new_recipe_path, alert: recipe.errors.full_messages.each {|m| m}.join
    end


  end

  def show
    @recipe = find_by_id(Recipe)

  end

  def destroy
    recipe = find_by_id(Recipe)
    recipe.delete
    redirect_to root_path
  end

  def sorted_favorite
    binding.pry
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

  private 

  def recipe_params
    params.require(:recipe).permit(:name, :time_in_minutes, :instructions)
  end

  def recipe_ingredient_params
    params.require(:recipe).permit(recipe_ingredients_attributes: [:quantity, :ingredient_id, ingredient: [:name]])
  end
end
