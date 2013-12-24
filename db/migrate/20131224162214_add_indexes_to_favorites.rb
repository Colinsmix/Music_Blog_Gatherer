class AddIndexesToFavorites < ActiveRecord::Migration
  def up
    add_index :favorites, :user_id
    add_index :favorites, :blog_id
  end

  def down
    remove_index :favorites, :user_id
    remove_index :favorites, :blog_id
  end
end
