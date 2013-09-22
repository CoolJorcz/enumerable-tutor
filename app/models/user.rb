class User < ActiveRecord::Base
  has_many :user_challenge_attempts
  has_many :challenges, through: :user_challenge_attempts
  has_many :attempts, through: :user_challenge_attempts


  def self.from_auth(auth)
    where(auth.slice(:id, :name)).first_or_initialize.tap do |user|
      user.socrates_id = auth.id
      user.name = auth.name
      user.email = auth.email
      user.save!
    end
  end
end
