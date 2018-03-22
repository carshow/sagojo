class AddForeignKey < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :profiles, :users, column: :user_id
  end
end
