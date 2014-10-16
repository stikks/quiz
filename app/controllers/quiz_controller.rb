class QuizController < ApplicationController
  layout 'admin'

  def index
    @quizzes = Quiz.sorted
  end
  def new_c
    @quizzes = Quiz.sorted
  end

  def create
      @quiz = Quiz.new
      @quiz.name = params[:name]
      @quiz.about = params[:about]
      @quiz.userid = session[:user_id]
      if @quiz.save
        session[:quiz_id] = @quiz.id
        flash[:notice] = "Quiz creation is a success! Continue>>"
        redirect_to(:action => 'new_c')
      else
        # If save fails, redisplay the form so user can fix problems
        render('new')
      end
  end
   def create_c
      @choice = Choice.new
      @choice.question = params[:question]
      @choice.choice1 = params[:choice1]
      @choice.choice2 = params[:choice2]
      @choice.choice3 = params[:choice3]
      @choice.choicec = params[:choicec]
      @choice.quizid = session[:quiz_id]
      if @choice.save
        
        flash[:notice] = "Question creation is a success! Continue>>"
        redirect_to(:action => 'new_c')
      else
        # If save fails, redisplay the form so user can fix problems
        render('new')
      end
  end
end
