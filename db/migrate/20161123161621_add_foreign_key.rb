class AddForeignKey < ActiveRecord::Migration
  def change
        #add_foreign_key :theTableIWantToAdd , :theTableFromWhere
    #add_reference :theTableIWantToAdd, :theTableFromWhere, index: true, foreign_key: true
    
    #add_foreign_key :formanswers , :students
    #add_foreign_key :forms , :staffs
    
    add_column :formanswers , :user_id , :integer
    add_column :forms , :user_id , :integer
    add_column :studanswers , :formanswer_id , :integer
    add_column :formanswers , :form_id , :integer
    add_column :sections , :form_id , :integer
    add_column :questions , :section_id , :integer
    add_column :answers , :question_id , :integer
    add_column :subanswers , :answer_id , :integer
   
    add_column :subquestionanswers , :subquestion_id , :integer
    
   
           #add_reference :studanswers, :formanswers, index: true, foreign_key: true
    #add_reference :formanswers, :forms, index: true, foreign_key: true
    #add_reference :sections , :forms, index: true, foreign_key: true
    #add_reference :questions , :sections, index: true, foreign_key: true
    #add_reference :subquestions , :questions, index: true, foreign_key: true
    #add_reference :answers , :subquestions, index: true, foreign_key: true
    #add_reference :subanswers , :answers, index: true, foreign_key: true
    
    add_foreign_key :formanswers , :users
    add_foreign_key :forms , :users
    add_foreign_key :studanswers , :formanswers
    add_foreign_key :formanswers , :forms
    add_foreign_key :sections , :forms
    add_foreign_key :questions , :sections
    add_foreign_key :answers , :questions
    add_foreign_key :subanswers , :answers
    
    add_foreign_key :subquestionanswers , :subquestions
  end
end
