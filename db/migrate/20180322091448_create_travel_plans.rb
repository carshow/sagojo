class CreateTravelPlans < ActiveRecord::Migration[5.0]
  def change
    create_table :travel_plans do |t|
      t.string :departure_time, null: false
      t.string :return_time, null: false
      t.text :destination, null: false
      t.references :profile, foreign_key: true
      t.timestamps
    end
  end
end
