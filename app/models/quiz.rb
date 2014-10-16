class Quiz < ActiveRecord::Base
	scope :sorted, lambda{ order("quizzes.id ASC")}
end
