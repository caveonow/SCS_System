class AddForeignKey < ActiveRecord::Migration
  def change
        #add_foreign_key :theTableIWantToAdd , :theTableFromWhere
    #add_reference :theTableIWantToAdd, :theTableFromWhere, index: true, foreign_key: true
    

    add_column :forms , :user_id , :integer
    add_column :sections , :form_id , :integer
    add_column :questions , :section_id , :integer
    add_column :answers , :question_id , :integer
    add_column :subanswers , :answer_id , :integer 
    add_column :subquestions , :answer_id , :integer  
    add_column :subquestionanswers, :subquestion_id, :integer
    add_column :formanswers , :user_id , :integer
    add_column :formanswers , :form_id , :integer
    add_column :studanswers , :formanswer_id , :integer
    add_column :studanswers , :answer_id , :integer
    add_column :studsubanswers , :formanswer_id , :integer
    add_column :studsubanswers , :subanswer_id , :integer
    add_column :studsubquestionanswers , :formanswer_id , :integer
    add_column :studsubquestionanswers , :subquestionanswer_id , :integer
    

  
    add_foreign_key :forms , :users
    add_foreign_key :sections , :forms
    add_foreign_key :questions , :sections
    add_foreign_key :answers , :questions
    add_foreign_key :subanswers , :answers
    add_foreign_key :subquestions , :answers
    add_foreign_key :subquestionanswers, :subquestions
    add_foreign_key :formanswers , :users 
    add_foreign_key :formanswers , :forms 
    add_foreign_key :studanswers , :formanswers
    add_foreign_key :studanswers , :answers 
    add_foreign_key :studsubanswers , :formanswers
    add_foreign_key :studsubanswers , :subanswers
    add_foreign_key :studsubquestionanswers , :formanswers
    add_foreign_key :studsubquestionanswers , :subquestionanswers
    
  end
end
