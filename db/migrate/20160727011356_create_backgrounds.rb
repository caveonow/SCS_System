class CreateBackgrounds < ActiveRecord::Migration
  def change
    create_table :backgrounds do |t|
      t.string :BackgroundName
      t.binary :BackgroundPic

      t.timestamps null: false
    end
  end
end
