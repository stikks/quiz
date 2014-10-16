class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
    	t.string "name"
    	t.string "choice1"
    	t.string "choice2"
    	t.string "choice3"
    	t.string "choicec"
    	t.string "userid"
      t.timestamps
    end
  end
end
