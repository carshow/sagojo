class AddColumnsToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :title, :string
    add_column :articles, :overview, :string
    add_column :articles, :qualification, :string
    add_column :articles, :requested_number_of_people, :integer
    add_column :articles, :period, :integer
    add_column :articles, :destination, :string
    add_column :articles, :company_name, :string
    add_column :articles, :end_of_date, :datetime
    add_column :articles, :extra_comment, :string
    remove_column :articles, :application_end_date_y
    remove_column :articles, :application_end_date_m
    remove_column :articles, :application_end_date_d
  end
end
