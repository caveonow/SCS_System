class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :AnswerDesc
      t.boolean :isSubAnswer
      t.integer :AnswerCount

      t.timestamps null: false
    end
  end
end
