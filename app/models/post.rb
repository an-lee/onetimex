class Post < ApplicationRecord
  validates :title, presence: true
  belongs_to :product, counter_cache: true
  belongs_to :user, counter_cache: true
  has_many :comments, as: :commentable

end
