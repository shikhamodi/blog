class Playlist < ActiveRecord::Base
	belongs_to :blog
	extend FriendlyId
  friendly_id :link, use: :slugged
end
