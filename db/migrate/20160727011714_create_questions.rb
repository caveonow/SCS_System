class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :QuestionDesc
      t.integer :QuestionNumber
      t.boolean :isSubQuestion

      t.timestamps null: false
    end
  end
end
