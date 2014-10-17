class QuizController < ApplicationController
  layout 'admin'
  before_action :confirm_logged_in, :except => [:show, :index, :submit_a, :submit_a]
  def index
    @quizzes = Quiz.sorted
    @users = User.sorted
    session[:question_n] = -1
    session[:quiz_id] = 0
  end
  def new_c
    @quizzes = Quiz.sorted
  end

  def show
      

      if session[:quiz_id] == 0

        session[:question_n] += 1
        session[:quiz_id] = params[:id]
        session[:correct_a] = 0

        @quiz = Quiz.find(session[:quiz_id])
        @question = Choice.where(quizid: session[:quiz_id])

        @question = @question[session[:question_n]]

        session[:correct_c] = @question.choicec
      else

        @quiz = Quiz.find(session[:quiz_id])
        @question = Choice.where(quizid: session[:quiz_id])

        @question = @question[session[:question_n]] 

        if @question
            
        else
          result = session[:correct_a] * 100 /session[:question_n] 
          flash[:notice] = "Your have finished the quiz! Your scored " + result.to_s + "%"
          redirect_to(:action => 'index')
        end
        
      end
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

  def submit_a
    if session[:correct_c] == params[:choice]
      session[:correct_a] += 1
      flash[:notice] = "Your answer is correct!"
    else
      flash[:notice] = "Your answer is wrong correct option is OPTION:" + session[:correct_c]
    end
    session[:question_n] += 1
    redirect_to(:action => 'show')

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
  def show_result
    
  end
  def logout
    # mark user as logged out
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to(:controller => 'welcome',:action => "login")
  end 
end
