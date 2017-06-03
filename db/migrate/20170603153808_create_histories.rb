class CreateHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :histories do |t|
      t.string :pseudoID
      t.string :course_data
      t.integer :course_num
      t.integer :year
      t.integer :quarter_num
      t.string :quarter_text
      t.integer :section

      t.timestamps

    end
  end
end
