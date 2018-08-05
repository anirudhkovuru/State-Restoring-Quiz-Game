class AddQuestionNoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :qid1, :integer, default: 0
    add_column :users, :qid2, :integer, default: 0
    add_column :users, :qid3, :integer, default: 0
    add_column :users, :qid4, :integer, default: 0
  end
end
