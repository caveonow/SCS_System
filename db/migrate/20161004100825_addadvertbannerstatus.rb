class Addadvertbannerstatus < ActiveRecord::Migration
  def change
    add_column :advertisements, :statusAd, :string , :default => "deactive"
    add_column :bannerslides,  :statusBs, :string , :default => "deactive"
    add_column :users, :statusUs, :string, :default => "deactive"
  end
end
