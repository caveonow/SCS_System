class CreateTranslators < ActiveRecord::Migration
  def change
    create_table :translators do |t|
      t.string :TranslatorEng
      t.string :TranslatorChinese
      t.text :TranslatorDescription

      t.timestamps null: false
    end
  end
end
