class ChangeVerifiedToStatusInBlogs < ActiveRecord::Migration
  def up
    rename_column :blogs, :verified?, :status
  end

  def down
    rename_column :blogs, :status, :verified?
  end
end
