class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :AdvertisementName
      t.text :AdvertisementDescription

      t.timestamps null: false
    end
  end
end
