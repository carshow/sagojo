class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string, unique: true
    add_column :users, :check_box, :boolean, default: false, null: false
  end
end
