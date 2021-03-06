require_relative '../../db/rubydocscraper.rb'

class Hint < ActiveRecord::Base
  belongs_to :challenge
  
  before_save do
    self.html = RubyDocScraper.find_html(self.method) rescue errors.add(:method, "not found from enumerable docs")
  end
end
