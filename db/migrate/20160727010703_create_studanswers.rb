class CreateStudanswers < ActiveRecord::Migration
  def change
    create_table :studanswers do |t|
      t.integer :ParentID
      t.timestamps null: false
    end
  end
end
