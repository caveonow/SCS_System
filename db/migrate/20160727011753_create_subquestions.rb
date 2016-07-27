class CreateSubquestions < ActiveRecord::Migration
  def change
    create_table :subquestions do |t|
      t.text :SubquestionDesc

      t.timestamps null: false
    end
  end
end
