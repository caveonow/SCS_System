class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :QuestionDesc
      t.integer :QuestionNumber

      t.timestamps null: false
    end
  end
end
