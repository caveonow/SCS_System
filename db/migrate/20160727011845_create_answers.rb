class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :AnswerDesc
      t.integer :ParentID
      t.boolean :IsSubAnswer
      t.integer :AnswerCount
      
      t.timestamps null: false
    end
  end
end
