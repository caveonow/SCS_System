class CreateFormanswers < ActiveRecord::Migration
  def change
    create_table :formanswers do |t|
      t.string :FormStatus
      t.datetime :StudAnswerDateTime
      t.timestamps null: false
    end
  end
end
