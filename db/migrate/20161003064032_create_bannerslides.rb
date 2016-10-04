class CreateBannerslides < ActiveRecord::Migration
  def change
    create_table :bannerslides do |t|
      t.string :name
      t.string :imageBs

      t.timestamps null: false
    end
  end
end
