class CommentsController < ApplicationController
  before_action :post
  before_action :ensure_current_author, only: %i[create edit update destroy]

  def create
    @comment = @post.comments.create(comment_params.merge(author_id: current_author.id))
    #@comment = @post.comments.build
    redirect_to post_path(@post)
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)

    if @comment.update(comment_params)
      redirect_to post_path(@post), notice: 'Comment was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :status, :post_id, :parent_id)
  end

  def post
    @post = Post.find(params[:post_id])
  end
end
