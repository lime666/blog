class AuthorCommentVote < ApplicationRecord
  validates :author_id, uniqueness: {scope: :comment_id}
  belongs_to :comment
  belongs_to :author

  enum vote_value: %i[not_voted liked disliked]
end
