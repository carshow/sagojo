class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
       t.references    :user, null: false
      t.string        :avatar
      t.string        :background_image
      t.string        :catch_phrase
      t.integer       :birth_date_y
      t.integer       :birth_date_m
      t.integer       :birth_date_d
      t.integer       :sex
      t.integer       :phone_number
      t.integer       :postal_code
      t.string        :region
      t.string        :city
      t.string        :adress
      t.string        :building_name
      t.string        :you_are_here
      t.string        :private_link
      t.text          :page_view
      t.string        :sns
      t.text          :follower
      t.text          :occupations
      t.text          :language_skill
      t.text          :experience
      t.text          :travel_history
      t.text          :detailed_skill
      t.text          :achievement
      t.string        :income
      t.text          :prepratatory_time
      t.text          :travel_purpose
      t.text          :introduction
      t.timestamps
    end
  end
end
