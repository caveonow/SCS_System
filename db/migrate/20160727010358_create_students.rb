class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :StudentName
      t.string :StudentIC
      t.integer :StudentAge
      t.string :StudentProgramme
      t.string :StudentPassword
      t.string :StudentEmail
      t.datetime :StudentLogAccess

      t.timestamps null: false
    end
  end
end
