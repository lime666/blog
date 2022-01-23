class CommentsController < ApplicationController
  before_action :post


  def create
    @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.published!
    redirect_to post_path(@comment.post)
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :status, :post_id, :author_id)
  end

  def post
    @post = Post.find(params[:post_id])
  end
end
