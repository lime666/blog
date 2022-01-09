class Post < ApplicationRecord
  validates :title, :content, presence: true
  validates :title, length: { in: 30..80 }
  validates :content, length: { in: 250..5000 }
  belongs_to :author
  has_rich_text :content
end
