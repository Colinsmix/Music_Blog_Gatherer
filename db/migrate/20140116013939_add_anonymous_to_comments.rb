class AddAnonymousToComments < ActiveRecord::Migration
  def up
    add_column :comments, :anonymous?, :boolean, default: false
  end

  def down
    remove_column :comments, :anonymous?
  end
end
