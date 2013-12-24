class AddSubmitterIdToBlogs < ActiveRecord::Migration
  def up
    add_column :blogs, :submitter_id, :integer
  end

  def down
    remove_column :blogs, :submitter_id
  end
  
end
