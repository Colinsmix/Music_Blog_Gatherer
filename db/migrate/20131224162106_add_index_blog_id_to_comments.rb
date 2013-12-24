class AddIndexBlogIdToComments < ActiveRecord::Migration
  def up
    add_index :comments, :blog_id
  end

  def down
    remove_index :comments, :blog_id
  end
end
