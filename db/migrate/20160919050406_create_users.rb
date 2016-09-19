class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :Name
      t.string :ICNumber
      t.string :Age
      t.string :Programme
      t.string :passwrod_digest
      t.string :Email
      t.datetime :LogAccess
      t.string :Role

      t.timestamps null: false
    end
  end
end
