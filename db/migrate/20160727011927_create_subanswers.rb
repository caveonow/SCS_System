class CreateSubanswers < ActiveRecord::Migration
  def change
    create_table :subanswers do |t|
      t.text :SADesc
      t.integer :SACount

      t.timestamps null: false
    end
  end
end
