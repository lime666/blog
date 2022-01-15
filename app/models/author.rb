class Author < ApplicationRecord
  #depend :destroy
  validates :first_name, :last_name, presence: true
  has_many :posts, dependent: :destroy
  has_many :comments, through: :posts, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end
end
