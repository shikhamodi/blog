class Blog < ActiveRecord::Base
	belongs_to :user
	mount_uploader :image, AvatarUploader
	extend FriendlyId
  friendly_id :title, use: :slugged
   
end

