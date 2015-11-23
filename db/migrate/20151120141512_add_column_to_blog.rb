class AddColumnToBlog < ActiveRecord::Migration
  def change
  	add_column :blogs, :image_url, :string
  	add_column :blogs, :youtube_url, :string
  end
end
