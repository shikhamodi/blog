class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string :comment
    	t.string :blog_id

      t.timestamps null: false
    end
  end
end
