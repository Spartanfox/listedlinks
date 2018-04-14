class AddToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string, unique: true, default: nil,null: false
    add_column :users, :authorisation, :integer, :default => 0
  end
end
