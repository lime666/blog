class AuthorCommentVotesController < ApplicationController
  before_action :set_comment
  before_action :ensure_current_author

  def like
  	@comment.author_comment_votes.create(author_id: current_author.id, vote_value: 'liked')
  	redirect_to post_path(@comment.post)
  end

  def dislike
    @comment.author_comment_votes.create(author_id: current_author.id, vote_value: 'disliked')
  	redirect_to post_path(@comment.post)
  end

  private

  def set_comment
  	@comment = Comment.find(params[:comment_id])
  end

  def vote_params
  	params.require(:author_comment_vote).permit(:comment_id, :author_id, :vote_value)
  end
end
