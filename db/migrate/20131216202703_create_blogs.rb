class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.string :verified?, default: 'unverified'
      t.integer :user_id
      t.timestamps
    end
  end
end
