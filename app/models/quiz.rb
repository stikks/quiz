class Quiz < ActiveRecord::Base
	belongs_to :user
	has_many :choices
	scope :sorted, lambda{ order("quizzes.id ASC")}
end
