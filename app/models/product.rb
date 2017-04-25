class Product < ApplicationRecord
  validates :title, presence: true
  before_validation :generate_friendly_id, :on => :create
  mount_uploader :image, ImageUploader

  has_many :cart_items
  has_many :comments, as: :commentable
  has_many :posts
  has_many :scores, :class_name => "ProductScore"

  def find_score(user)
    user && self.scores.where( :user_id => user.id ).first
  end

  def average_score
    self.scores.average(:score)
  end

  def to_param
    self.friendly_id
  end

  protected

  def generate_friendly_id
    self.friendly_id ||= SecureRandom.uuid
  end

end
