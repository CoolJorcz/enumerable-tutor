class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name, null: false
      t.text :problem_statement, null: false
      t.integer :challenge_order
      t.string :initial_data
      t.string :expected_output
      t.timestamps
    end
  end
end
