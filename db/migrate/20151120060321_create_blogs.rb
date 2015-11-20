class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
    	t.string :title
    	t.string :discription
    	t.string :image

      t.timestamps null: false
    end
  end
end
