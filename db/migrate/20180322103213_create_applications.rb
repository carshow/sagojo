class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.text :often_visiting_places
      t.text :good_at_genre
      t.references :user, foreign_key: true
      t.references :profile, foreign_key: true
      t.references :article, foreign_key: true
      t.timestamps
    end
  end
end
