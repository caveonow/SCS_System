class AddSubquestionanswers < ActiveRecord::Migration
  def change
    
    add_column :subquestionanswers , :subquestion_id , :integer
    add_foreign_key :subquestionanswers , :subquestions

    
  end
end
