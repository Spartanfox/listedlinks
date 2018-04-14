class CreateLink < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|

      t.string :name, null: false
      t.string :link, null: false

      t.integer :slug               , default: 0
      t.integer :clicks             , default: 0
      t.integer :daily_clicks       , default: 0
      t.integer :unique_clicks      , default: 0
      t.integer :unique_daily_clicks, default: 0

      t.references :page, foreign_key: true
      
    end
  end
end
