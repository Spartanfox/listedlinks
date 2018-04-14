class CreatePage < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|

      t.text    :bio

      t.string  :banner_url
      t.string  :background_color
      t.string  :background_url
      t.string  :button_background_color
      t.string  :button_background_url

      t.boolean :ad_visible, default: true

      t.references :user, foreign_key: true

    end
  end
end
