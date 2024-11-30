class RecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:user).order(created_at: :desc)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to recipes_path, notice: "レシピを投稿しました！"
    else
      render :new, status: :unprocessable_entity  #HTTP(422)のステータスコードを表示させるために設定
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :ingredients_text, :step_text)
  end
end
