class Comment < ApplicationRecord
  belongs_to :post

  enum status: %i[unpublished published]
end
