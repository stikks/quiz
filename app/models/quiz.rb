class Quiz < ActiveRecord::Base
	has_many :choices
	scope :sorted, lambda{ order("quizzes.id ASC")}
end
