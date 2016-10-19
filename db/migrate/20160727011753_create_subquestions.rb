class CreateSubquestions < ActiveRecord::Migration
  def change
    create_table :subquestions do |t|
      t.text :SQDesc
      t.string :SQChar

      t.timestamps null: false
    end
  end
end
