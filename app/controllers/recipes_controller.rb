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
    @recipe = find_by_id(Recipe) || Recipe.first
      respond_to do |format|
        format.html  { render :show }
        format.json { render json: @recipe}
      end
  end

  def next
    binding.pry
    if @recipe = Recipe.find_by(id: (params[:id] + 1))
      binding.pry
    else
      @recipe = Recipe.first
    end
  end

  def destroy
    if authorized_admin
      # recipe = find_by_id(Recipe)
      # recipe.delete
      redirect_to root_path
    end
  end

  def sorted_favorite
    recipes = Favorite.get_favorite_recipes_in_order
    render json: recipes
  end

  def sorted_cook_time
    recipes = Recipe.fastest
    render json: recipes
  end

  def sorted_newest
    recipes = Recipe.newest
    render json: recipes
  end

  private 

  def recipe_params
    params.require(:recipe).permit(:name, :time_in_minutes, :instructions)
  end

  def recipe_ingredient_params
    params.require(:recipe).permit(recipe_ingredients_attributes: [:quantity, :ingredient_id, ingredient: [:name]])
  end

end
