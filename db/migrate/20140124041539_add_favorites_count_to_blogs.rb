class AddFavoritesCountToBlogs < ActiveRecord::Migration
  def up
    add_column :blogs, :favorites_count, :integer, default: 0

    Blog.reset_column_information
    Blog.all.each do |p|
      p.update_attribute :favorites_count, p.users.length
    end
  end

  def down
    remove_column :blogs, :favorites_count
  end
end
