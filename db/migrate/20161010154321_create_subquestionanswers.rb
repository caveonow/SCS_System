class CreateSubquestionanswers < ActiveRecord::Migration
  def change
    create_table :subquestionanswers do |t|
         
      t.string  :SQAnswer
      t.integer :SQAnswerCount, default: 0, null: false
      t.integer :subquestion_id 
      t.timestamps null: false
    end
    
    add_foreign_key :subquestionanswers , :subquestions
  end
end
