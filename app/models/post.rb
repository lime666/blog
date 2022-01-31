class Post < ApplicationRecord
  include ActionView::Helpers::DateHelper
  validates :title, :content, presence: true
  validates :title, length: { in: 30..80 }
  validates :content, length: { in: 250..5000 }
  belongs_to :author
  has_rich_text :content
  has_many :comments, dependent: :destroy

  paginates_per 3
end
