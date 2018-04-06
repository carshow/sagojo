class CreateSholabos < ActiveRecord::Migration[5.0]
  def change
    create_table :sholabos do |t|
      t.string :title, null: false
      t.string :image, null: false
      t.text :text, null: false
      t.string :writer_image, null: false
      t.string :writer, null: false
      t.text :comment, null: false
      t.timestamps
    end
  end
end
