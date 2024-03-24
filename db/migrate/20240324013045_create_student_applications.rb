class CreateStudentApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :student_applications do |t|
      t.string :name
      t.string :email
      t.text :question1
      t.text :question2
      t.text :question3
      t.text :question4
      t.text :question5
      t.belongs_to :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
