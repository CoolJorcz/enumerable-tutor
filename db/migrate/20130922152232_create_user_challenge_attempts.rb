class CreateUserChallengeAttempts < ActiveRecord::Migration
  def change
    create_table :user_challenge_attempts do |t|
      t.belongs_to :user
      t.belongs_to :challenge
    end
  end
end
