class CreateUserJobtags < ActiveRecord::Migration[5.0]
  def change
    create_table :user_jobtags do |t|
      t.references :user, foreign_key: true
      t.references :job_tag, foreign_key: true
      t.timestamps
    end
  end
end
