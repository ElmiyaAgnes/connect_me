class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :user_posts, dependent: :destroy
  has_many :users, through: :user_posts

  validates :title, presence: true
end
