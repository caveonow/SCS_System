class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :StaffName
      t.string :StaffIC
      t.integer :StaffAge
      t.string :StaffEmail
      t.string :password_digest
      t.datetime :StaffLogAccess

      t.timestamps null: false
    end
  end
end
