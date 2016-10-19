class CreateStudanswers < ActiveRecord::Migration
  def change
    create_table :studanswers do |t|
      t.string :answer_id
      

      t.timestamps null: false
    end
  end
end
