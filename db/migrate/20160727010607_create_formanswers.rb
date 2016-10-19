class CreateFormanswers < ActiveRecord::Migration
  def change
    create_table :formanswers do |t|
      t.string :FormAnswer
      t.datetime :StudAnswerDateTime

      t.timestamps null: false
    end
  end
end
