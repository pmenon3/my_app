class CreateRecommendations < ActiveRecord::Migration[5.0]
  def change
    create_table :recommendations do |t|
      t.integer :user_num
      t.string :pseudoID
      t.integer :course_id
      t.integer :cluster
      t.string :course_name

      t.timestamps

    end
  end
end
