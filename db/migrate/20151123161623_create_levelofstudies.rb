class CreateLevelofstudies < ActiveRecord::Migration
  def change
    create_table :levelofstudies do |t|
      t.string :levelname
      
     
      t.timestamps null: false
    end
  end
end
