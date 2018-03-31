class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :Users, :name, :string, unique: true
    add_column :Users, :check_box, :boolean, default: false, null: false
  end
end
