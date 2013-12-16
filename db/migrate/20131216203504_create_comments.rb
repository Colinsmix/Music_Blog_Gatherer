class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.string :moderation, default: 'unverified'
      t.integer :user_id
      t.integer :blog_id, null: false
      t.timestamps
    end
  end
end
