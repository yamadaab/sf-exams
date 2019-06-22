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
    redirect_to categories_url, notice: 'カテゴリーの作成に成功しました。'
  else
      render 'new'
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
  @category.destroy
   redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
