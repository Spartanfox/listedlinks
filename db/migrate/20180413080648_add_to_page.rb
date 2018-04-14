class AddToPage < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :reports, :integer
  end
end
