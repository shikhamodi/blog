class PostAttachment < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
   belongs_to :blog
   extend FriendlyId
  friendly_id :avatar, use: :slugged
end

