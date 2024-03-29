class Author < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, presence: true
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :author_comment_votes, dependent: :destroy
  validates :email, presence: true, uniqueness: true
  # validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, presence: true, length: { minimum: 8, maximum: 30 }, allow_nil: true

  def full_name
    "#{first_name} #{last_name}"
  end

end
