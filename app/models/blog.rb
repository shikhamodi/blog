class Blog < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true
	mount_uploader :image, AvatarUploader
	extend FriendlyId
  friendly_id :title, use: :slugged
   has_many :comments
end

