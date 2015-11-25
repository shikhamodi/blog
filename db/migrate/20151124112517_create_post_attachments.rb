class CreatePostAttachments < ActiveRecord::Migration
  def change
    create_table :post_attachments do |t|
      t.string :blog_id
      t.string :avatar
      t.string :slug

      t.timestamps null: false
    end
  end
end
