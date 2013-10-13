class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
    
  has_many :attempts


  def self.from_auth(auth)
    where(auth.slice(:id, :name)).first_or_initialize.tap do |user|
      user.socrates_id = auth.id
      user.name = auth.name
      user.email = auth.email
      user.gravatar = auth.gravatar
      user.save!
    end
  end

  def completed?(challenge)
    completed_challenges.include?(challenge)
  end

  def progress
    ((completed_challenges.count / Challenge.all.count.to_f)*100).to_i
  end

  private

  def completed_challenges
    attempts.where(:passed => true).count(:group => :challenge).keys
  end
end
