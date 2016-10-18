class ChangeSomeKeys < ActiveRecord::Migration
  def change

    add_column :subquestions , :answer_id , :integer
    add_foreign_key :subquestions , :answers


  end
end
