class CommentsController < ApplicationController
  before_action :post
  before_action :ensure_current_author, only: %i[ create edit update destroy ]

  def create
    @post.comments.create(comment_params.merge(author_id: current_author.id))
    redirect_to post_path(@post)
  end

  def edit
    #@comment = @post.comments.find(params[:id])
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
    params.require(:comment).permit(:body, :status, :post_id)
  end

  def post
    @post = Post.find(params[:post_id])
  end
end
