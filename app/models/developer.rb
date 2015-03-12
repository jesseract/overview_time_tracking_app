class Developer < ActiveRecord::Base
  has_secure_password
  has_many :hours

  def count_hours
    total_hours = []
    start_day = Time.now.beginning_of_week.to_date
    end_day = Time.now.end_of_week.to_date
    self.hours.each do |h|
      if h.worked_on >= start_day && h.worked_on <= end_day
        total_hours << h.duration
      end
    end
    total_hours.reduce(:+)
  end

  # def overtime?
  #   hours = []
  #   start_day = Time.now.beginning_of_week
  #   end_day = Time.now.end_of_week
  #   self.hours.each do |h|
  #     if h.worked_on <= start_day && h.worked_on >= end_day
  #       hours << h.duration
  #     end
  #     hours
  #   end
  #   if hours > 40
  #     overtime? == true
  #     @chastise = "WARNING: You have too many hours!"
  #   end
  # end


end
