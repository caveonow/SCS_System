class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :ICNo
      t.date :DateOfBirth
      t.string :age
      t.string :gender
      t.belongs_to :role, index: true, foreign_key: true
      t.belongs_to :faculty, index: true, foreign_key: true
      t.belongs_to :yearofstudy, index: true, foreign_key: true
      t.belongs_to :levelofstudy, index: true, foreign_key: true
      t.belongs_to :programme, index: true, foreign_key: true    
      
      t.timestamps null: false
    end
  end
end
