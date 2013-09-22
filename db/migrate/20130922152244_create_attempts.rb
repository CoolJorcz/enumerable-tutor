class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.belongs_to :user_challenge_attempt
      t.text :attempt_text, null: false
      t.boolean :passed, default: false
      t.timestamps
    end
  end
end
