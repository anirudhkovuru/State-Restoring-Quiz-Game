class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :question
      t.text :opt1
      t.text :opt2
      t.text :opt3
      t.text :opt4
      t.text :answer
      t.string :genre

      t.timestamps
    end
  end
end
