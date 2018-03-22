class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false, unique: true
      t.string :email, null: false, unique: true
      t.timestamps
    end
  end
end
