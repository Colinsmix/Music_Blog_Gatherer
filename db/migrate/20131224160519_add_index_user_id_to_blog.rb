class AddIndexUserIdToBlog < ActiveRecord::Migration
  def up
    add_index :blogs, :user_id
  end

  def down
    remove_index :blogs, :user_id
  end
end
