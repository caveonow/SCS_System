class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :FormName
      t.text :FormDescription
      t.datetime :FormDateTime
      t.string :FormStatus

      t.timestamps null: false
    end
  end
end
