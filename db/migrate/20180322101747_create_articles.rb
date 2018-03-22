class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.text :text, null: false
      t.string :image, null: false
      t.text :comment, null: false
      t.integer :price, null: false
      t.integer :application_end_date_y, null: false
      t.integer :application_end_date_m, null: false
      t.integer :application_end_date_d, null: false
      t.references :company, foreign_key: true
      t.timestamps
    end
  end
end
