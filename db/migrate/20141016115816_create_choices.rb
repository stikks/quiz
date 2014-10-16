class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
    	t.string "question"
    	t.string "choice1"
    	t.string "choice2"
    	t.string "choice3"
    	t.string "choicec"
    	t.string "quizid"
      t.timestamps
    end
  end
end
