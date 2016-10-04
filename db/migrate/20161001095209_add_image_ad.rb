class AddImageAd < ActiveRecord::Migration
  def change
     add_column :advertisements, :imageAd, :string
  end
end
