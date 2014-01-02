class AddDescriptionToBlog < ActiveRecord::Migration
  def up
    add_column :blogs, :description, :text, null: false
  end

  def down
    remove_column :blogs, :description
  end
end
