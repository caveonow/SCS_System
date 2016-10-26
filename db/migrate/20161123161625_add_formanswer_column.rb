class AddFormanswerColumn < ActiveRecord::Migration
  def change
     add_column :formanswers,:StudCompletedDateTime, :datetime 
  end
end
