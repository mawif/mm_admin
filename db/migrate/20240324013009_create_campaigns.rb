class CreateCampaigns < ActiveRecord::Migration[7.1]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.integer :status
      t.boolean :accepting_reviews
      t.boolean :accepting_interviews

      t.timestamps
    end
  end
end
