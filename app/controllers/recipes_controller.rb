class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: [:show, :destroy]

  def index
    @recipes = current_user.recipes
  end

  def show
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: "Recipe was successfully deleted."
  end

  private

  def set_recipe
    @recipe = current_user.recipes.find(params[:id])
  end
end
