class CreateSubquestionanswers < ActiveRecord::Migration
  def change
    create_table :subquestionanswers do |t|      
      t.string  :SQAnswer
      t.integer :SQAnswerCount, default: 0, null: false
      t.timestamps null: false
    end
    
  end
end
