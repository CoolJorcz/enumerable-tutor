class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name, null: false
      t.text :problem_statement, null: false
      t.integer :order
      t.timestamps
    end
  end
end
