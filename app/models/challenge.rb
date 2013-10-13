class Challenge < ActiveRecord::Base
  has_one :hint

  has_many :user_challenge_attempts
  has_many :users, through: :user_challenge_attempts
  has_many :attempts, through: :user_challenge_attempts

  validates :name, presence: true
  validates :problem_statement, presence:true
  validate :check_initial_data
  validate :check_expected_output

  def check_initial_data
    begin
      eval initial_data
    rescue Exception => e
      p e
      errors.add(:given_data,"Doesn't evaluate to a ruby object")
    end
  end

  def check_expected_output
    begin
      eval expected_output
    rescue Exception => e
      errors.add(:expected_output, "Doesn't evaluate to a ruby object")
    end
  end
end
