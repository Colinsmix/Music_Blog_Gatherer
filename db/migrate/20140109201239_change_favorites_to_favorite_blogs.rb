class ChangeFavoritesToFavoriteBlogs < ActiveRecord::Migration
  def up
    rename_table :favorites, :favorite_blogs
  end

  def down
    rename_table :favorite_blogs, :favorites
  end
end
