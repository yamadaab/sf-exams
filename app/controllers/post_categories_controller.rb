class PostCategoriesController < ApplicationController
  def new
    @post_category = PostCategory.new
  end

  def index
    @post_categories = PostCategory.all
  end

  def create
      @post_category = PostCategory.new(post_category_params)
    if @post_category.save
      flash[:success] = "作成が完了しました"
      redirect_to post_categories_url
    else
      redirect_to post_categories_url
    end
  end

  def destroy
    @post_category = PostCategory.find(params[:id])
    @post_category.destroy
    flash[:success] = "削除しました"
     redirect_to post_categories_url
    end
  end

private

    def post_category_params
      params.require(:post_category).permit(:post_id, :category_id)
    end
