class AddSubgenreToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :subgenre, :string
  end
end
