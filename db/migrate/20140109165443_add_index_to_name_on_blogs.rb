class AddIndexToNameOnBlogs < ActiveRecord::Migration
  def up
    add_index :blogs, :name
  end

  def down
    remove_index :blogs, :name
  end
end
