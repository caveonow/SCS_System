class CreateStudanswers < ActiveRecord::Migration
  def change
    create_table :studanswers do |t|
      t.string :StudentAnswer
      t.string :StudentAnswer

      t.timestamps null: false
    end
  end
end
