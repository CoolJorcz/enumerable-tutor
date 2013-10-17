class Challenge < ActiveRecord::Base
  has_one :hint

  has_many :attempts

  validates :name, presence: true
  validates :problem_statement, presence:true
  validates :initial_data, presence: true
  validates :expected_output, presence: true
  validate :check_initial_data
  validate :check_expected_output

  after_create :init_order

  def expected_output
    eval read_attribute(:expected_output)
  end
  
  def init_order
    self.challenge_order ||=  self.id
    self.save
  end

  def passed_percentage
    ((attempts.where(passed: true).count / attempts.count.to_f) * 100).to_i rescue 0
  end

  def check_initial_data
    begin
      eval initial_data
    rescue Exception => e
      errors.add(:given_data,"doesn't evaluate to a ruby object")
    end
  end

  def check_expected_output
    begin
      eval expected_output
    rescue Exception => e
      errors.add(:expected_output, "doesn't evaluate to a ruby object")
    end
  end
end
