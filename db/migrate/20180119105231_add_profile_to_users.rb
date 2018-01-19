class AddProfileToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :stiring
    add_column :users, :intro, :text
    add_column :users, :avatar, :string
  end
end
