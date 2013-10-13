class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.belongs_to :challenge
      t.belongs_to :user
      t.text :attempt_text, null: false
      t.boolean :passed, default: false
      t.timestamps
    end
  end
end
