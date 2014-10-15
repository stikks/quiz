class User < ActiveRecord::Base
	#07 10
	#scope :visible, lambda {wherem(:active => true)} 
	scope :sorted, lambda{ order("users.id ASC")}
	# scope :search, lambda{|query|
	# 	where(["name LIKE ?", "%#{query}"])
	# }
end
