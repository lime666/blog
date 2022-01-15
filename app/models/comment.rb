class Comment < ApplicationRecord
  validates :body, presence: true
  belongs_to :post
  belongs_to :author

  enum status: %i[unpublished published]

  scope :unpublished, -> { where(status: 'unpublished') }
  scope :published, -> { where(status: 'published') }
end
