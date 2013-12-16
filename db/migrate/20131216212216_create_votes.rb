class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :amount, null: false
      t.integer :user_id, null: false
      t.integer :blog_id, null: false
      t.timestamps
    end
  end
end
