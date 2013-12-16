class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password, null: false
      t.string :first_name
      t.string :last_name
      t.string :email, null: false
      t.boolean :is_admin?, default: false
      t.timestamps
    end
  end
end
