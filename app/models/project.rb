class Project < ActiveRecord::Base
  has_many :hours

  def cumulative_hours
    
  end
end
