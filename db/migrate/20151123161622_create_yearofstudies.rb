class CreateYearofstudies < ActiveRecord::Migration
  def change
    create_table :yearofstudies do |t|
      t.string :year

      t.timestamps null: false
    end
  end
end
