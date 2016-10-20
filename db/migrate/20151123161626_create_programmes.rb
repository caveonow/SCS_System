class CreateProgrammes < ActiveRecord::Migration
  def change
    create_table :programmes do |t|
      t.string :programmename
      t.belongs_to :faculty, index: true, foreign_key: true


      t.timestamps null: false
    end
  end
end
