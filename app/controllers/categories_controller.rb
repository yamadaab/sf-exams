class CategoriesController < ApplicationController
  def new
  end

  def create
    @post = Post.find(params[:id])
    @category = @post.categoies.build(category_params)
    if @salon.save
      flash[:success] = "カテゴリーを登録しました"
      redirect_to root_url
    else
      flash[:danger] = "カテゴリーが登録できませんでした"
      redirect_to root_url

  def destroy
  end

private
  def category_params
    params.require(:category).permit(:name)
  end
end
