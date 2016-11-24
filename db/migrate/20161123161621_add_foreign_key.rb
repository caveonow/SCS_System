class AddForeignKey < ActiveRecord::Migration
  def change
        #add_foreign_key :theTableIWantToAdd , :theTableFromWhere
    #add_reference :theTableIWantToAdd, :theTableFromWhere, index: true, foreign_key: true
    

    add_column :forms , :user_id , :integer
    add_column :sections , :form_id , :integer
    add_column :questions , :section_id , :integer
    add_column :answers , :question_id , :integer
    add_column :formanswers , :user_id , :integer
    add_column :formanswers , :form_id , :integer
    add_column :studanswers , :formanswer_id , :integer
    add_column :studanswers , :answer_id , :integer
    

  
    add_foreign_key :forms , :users
    add_foreign_key :sections , :forms
    add_foreign_key :questions , :sections
    add_foreign_key :formanswers , :users 
    add_foreign_key :formanswers , :forms 
    add_foreign_key :studanswers , :formanswers
    add_foreign_key :studanswers , :answers 
    
  end
end
