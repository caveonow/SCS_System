class AddImageToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :image, :string
  end
end
