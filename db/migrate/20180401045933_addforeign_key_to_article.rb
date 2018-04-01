class AddforeignKeyToArticle < ActiveRecord::Migration[5.0]
  def change
    add_reference :articles, :company, foreign_key: true
  end
end
