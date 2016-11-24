class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :QuestionDesc
      t.integer :ParentID
      t.integer :QuestionNumber
      t.boolean :IsSubQuestion
      
      t.timestamps null: false
    end
  end
end
