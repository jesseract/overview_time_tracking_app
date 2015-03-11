class Developer < ActiveRecord::Base
  has_secure_password
  has_many :hours

end
