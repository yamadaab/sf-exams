class CommentsController < ApplicationController

  def destroy
    @comment = Comment.preload(:post,{post: :user}).find(params[:id])
    @post = @comment.post
    @user = @post.user
    if @comment.destroy
      flash[:success] = "コメントの削除が完了しました"
      redirect_to @post
    else
      flash[:warning] = "コメントの削除に失敗しました"
      redirect_to @post
    end
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "コメントを作成しました"
      redirect_to @comment.post
    else
      flash[:warning] = "コメントの作成に失敗しました"
      redirect_to @comment.post
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.preload(:post,{post: :user}).find(params[:id])
    @post = @comment.post
    @user = @post.user
    if @comment.update_attributes(comment_params)
      flash[:success] = "コメントを更新しました"
      redirect_to @post
    else
      flash.now[:warning] = "コメントの編集に失敗しました"
      render 'edit'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :user_id, :content)
  end

end