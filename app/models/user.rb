class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  
  has_many :user_challenge_attempts
  has_many :challenges, through: :user_challenge_attempts
  has_many :attempts, through: :user_challenge_attempts


  def self.from_auth(auth)
    where(auth.slice(:id, :name)).first_or_initialize.tap do |user|
      user.socrates_id = auth.id
      user.name = auth.name
      user.email = auth.email
      user.gravatar = auth.gravatar
      user.save!
    end
  end
end
