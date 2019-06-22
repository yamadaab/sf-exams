class PostCategoriesController < ApplicationController
  def new
    @post_category = PostCategory.new
  end

  def index
    @post_category = PostCategory.all
  end

  def create
      @post_category = PostCategory.new(post_category_params)
    if @post_category.save
      redirect_to posts_url, flash: {success: '作成が成功しました'}
    else
      redirect_to 'new'
    end
  end

  def destroy
  end
end

private

    def post_category_params
      params.require(:post_category).permit(:post_id, :category_id)
    end
