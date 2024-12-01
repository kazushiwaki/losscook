class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

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

  def show
  end

  def edit
  end

  def update
    @recipe = current_user.recipes.find_by(id: params[:id])
    if params[:recipe][:remove_image] == '1'
      @recipe.image.purge
    end

    if @recipe&.update(recipe_params)
      redirect_to recipe_path(@recipe), notice: "レシピの投稿内容を更新しました！"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: "レシピを削除しました。"
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :ingredients_text, :step_text, :image)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def authorize_user!
    redirect_to recipes_path, alert: "編集権限がありません！" unless @recipe.user == current_user
  end
end
