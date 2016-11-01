class CreateNewTables < ActiveRecord::Migration
  def change
    create_table :studsubanswers do |t|   
        
      t.timestamps null: false
    end
    
      create_table :studsubquestionanswers do |t| 
        
      t.timestamps null: false
    end
  end
end
