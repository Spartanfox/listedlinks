class AddTimestampsToAll < ActiveRecord::Migration[5.1]
  def change
    add_column :links, :created_at, :datetime, null: false, default: DateTime.now
    add_column :links, :updated_at, :datetime, null: false, default: DateTime.now
    add_column :pages, :created_at, :datetime, null: false, default: DateTime.now
    add_column :pages, :updated_at, :datetime, null: false, default: DateTime.now
    change_column_default :links, :created_at, nil
    change_column_default :links, :updated_at, nil
    change_column_default :pages, :created_at, nil
    change_column_default :pages, :updated_at, nil
  end
end
