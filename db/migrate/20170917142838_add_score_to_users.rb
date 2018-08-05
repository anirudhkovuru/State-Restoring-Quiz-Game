class AddScoreToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :score1, :integer, default: 0
    add_column :users, :score2, :integer, default: 0
    add_column :users, :score3, :integer, default: 0
    add_column :users, :score4, :integer, default: 0
  end
end
