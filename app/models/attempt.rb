class Attempt < ActiveRecord::Base
  validates :attempt_text, presence: true
  
  belongs_to :user_challenge_attempt
end
