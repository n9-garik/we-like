class Wish < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  
  belongs_to :user
  
  validates :title, presence: true
  validates :picture, presence: true
  validates :price, presence: true
  validates :content, length: {maximum: 300 }
  validates :user_id, presence: true
  
  default_scope order: 'wishes.created_at DESC'
  
  def self.from_users_followed_by(user)
      followed_user_ids = "SELECT followed_id FROM relationships
                           WHERE follower_id = :user_id"
      where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", user_id: user.id)
  end
end
