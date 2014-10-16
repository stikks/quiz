class AddChoiceTable < ActiveRecord::Migration
  
  def up
  	
  	remove_column "quizzes", "choice1"
  	remove_column "quizzes", "choice2"
  	remove_column "quizzes", "choice3"
  	remove_column "quizzes", "choicec"
  	add_column "quizzes", "about", :string
  end

  def down

  	add_column "quizzes", "choice1"
  	add_column "quizzes", "choice2"
  	add_column "quizzes", "choice3"
  	add_column "quizzes", "choicec"
  	remove_column "quizzes", "about", :string
  end
end
