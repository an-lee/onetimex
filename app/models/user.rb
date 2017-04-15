class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :orders
  has_many :comments
  has_many :posts

  def admin?
    is_admin
  end

  def display_name
   # # 取 email 的前半来显示，如果你也可以另开一个字段是 nickname 让用户可以自己编辑显示名称
   if self.name.present?
     self.name
   else
     self.email.split("@").first
   end
 end

end
