class Developer < ActiveRecord::Base
  has_secure_password
  has_many :hours

  def count_hours
    total_hours = 0
    start_day = Time.now.beginning_of_week.to_date
    end_day = Time.now.end_of_week.to_date
    self.hours.each do |h|
      if h.worked_on >= start_day && h.worked_on <= end_day
        total_hours += h.duration
      end
    end
    total_hours
  end

  def overtime?
    count_hours > 40
  end


end
