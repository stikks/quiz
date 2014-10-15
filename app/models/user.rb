class User < ActiveRecord::Base
	has_secure_password

	#07 10
	#scope :visible, lambda {wherem(:active => true)} 
	scope :sorted, lambda{ order("users.id ASC")}
	# scope :search, lambda{|query|
	# 	where(["name LIKE ?", "%#{query}"])
	# }
end
