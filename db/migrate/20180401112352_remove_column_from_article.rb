class RemoveColumnFromArticle < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :company_name
    add_column :articles, :image_of_person_in_charge, :string
  end
end
