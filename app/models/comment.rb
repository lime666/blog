class Comment < ApplicationRecord
  include ActionView::Helpers::DateHelper
  validates :body, presence: true
  belongs_to :post
  belongs_to :author
  has_many :author_comment_votes, dependent: :destroy

  enum status: %i[unpublished published]

  scope :unpublished, -> { where(status: 'unpublished') }
  scope :published, -> { where(status: 'published') }

end
