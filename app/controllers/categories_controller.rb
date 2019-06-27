class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "作成が完了しました"
      redirect_to categories_url
    else
      render categories_url
    end
  end


  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'カテゴリーを更新しました。'
    else
      render 'edit'
    end
  end


  def destroy
    @category = Category.find(params[:id])
    if  @category.destroy
      flash[:success] = "カテゴリを削除しました"
      redirect_to categories_url
    else
      flash[:warning] = "カテゴリを削除できませんでした"
      redirect_to categories_url
    end
  end

    private
      def set_category
        @category = Category.find(params[:id])
      end

      def category_params
        params.require(:category).permit(:name)
      end
end
