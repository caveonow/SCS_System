class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :SectionName
      t.text :SectionDescription

      t.timestamps null: false
    end
  end
end
