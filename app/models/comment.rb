class Comment < ApplicationRecord
  validates :content, presence: true
  belongs_to :commentable, polymorphic: true, counter_cache: true
  belongs_to :user, counter_cache: true
end
