class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :StaffName
      t.integer :StaffAge
      t.integer :StaffIC
      t.string :StaffEmail
      t.string :StaffPassword
      t.datetime :StaffLogAccess

      t.timestamps null: false
    end
  end
end
