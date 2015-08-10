class RecipesController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  # show ALL recipes in db
  def index
    @recipes = Recipe.all
    render :index
  end

  # form to create new recipe that BELONGS TO current_user
  def new
    @recipe = Recipe.new
    render :new
  end

  # creates new recipe in db that BELONGS TO current_user
  def create
    recipe = current_user.recipes.create(recipe_params)
    redirect_to recipe_path(recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
    render :show
  end

  def edit
    @recipe = Recipe.find(params[:id])
    if current_user.recipes.include? @recipe
    render :edit
    else
      redirect_to profile_path
    end
  end

  def update
    recipe = Recipe.find(params[:id])
    if current_user.recipes.include? recipe
      recipe.update_attributes(recipe_params)
      redirect_to recipe_path(recipe)
    else
      redirect_to profile_path
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    if current_user.recipes.include? recipe
      recipe.destroy_attributes(recipe_params)
      redirect_to recipe_path(recipe)
    else
      redirect_to profile_path
    end
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :instructions)
    end

end
