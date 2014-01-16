class ChangeAnonymousOnComments < ActiveRecord::Migration
  def up
    rename_column :comments, :anonymous?, :anonymous
  end

  def down
    rename_column :comments, :anonymous, :anonymous?
  end
end
