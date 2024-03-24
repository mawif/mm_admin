class CreateCampaigns < ActiveRecord::Migration[7.1]
  def change
    create_table :campaigns do |t|
      t.string :name, null: false
      t.integer :status, null: false
      t.boolean :accepting_reviews, null: false
      t.boolean :accepting_interviews, null: false

      t.timestamps
    end
  end
end
