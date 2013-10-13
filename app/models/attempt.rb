class Attempt < ActiveRecord::Base
  validates :attempt_text, presence: true
  
  belongs_to :challenge
  belongs_to :user
end
