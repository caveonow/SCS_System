class CreateSubanswers < ActiveRecord::Migration
  def change
    create_table :subanswers do |t|
      t.text :SubAnswerDesc
      t.integer :SubAnswerCount

      t.timestamps null: false
    end
  end
end
