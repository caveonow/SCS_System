class CreateProgrammes < ActiveRecord::Migration
  def change
    create_table :programmes do |t|
      t.string :programmename
      
      
      t.timestamps null: false
    end
  end
end
