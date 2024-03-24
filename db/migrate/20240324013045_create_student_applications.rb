class CreateStudentApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :student_applications do |t|
      t.string :name, null: false
      t.string :email, null: false, index: { unique: true }
      t.text :question1, null: false
      t.text :question2, null: false
      t.text :question3, null: false
      t.text :question4, null: false
      t.text :question5, null: false
      t.belongs_to :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
