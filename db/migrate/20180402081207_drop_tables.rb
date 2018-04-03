class DropTables < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key "user_jobtags", "job_tags"
    remove_foreign_key "user_jobtags", "users"
    remove_foreign_key "articles_categories", "articles"
    remove_foreign_key "articles_categories", "categories"
    drop_table :job_tags
    drop_table :user_jobtags
    drop_table :articles_categories
    drop_table :categories
  end
end
