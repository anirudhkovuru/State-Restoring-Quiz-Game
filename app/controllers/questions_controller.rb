class QuestionsController < ApplicationController
  before_action :logged_in_user, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:new, :create, :edit, :update, :destroy]

  def new
  	@quiz = Question.new
  end

  def show
    @id = params[:id].to_i
    user = User.find(session[:user_id])
    if @id == 0
      if params[:genre] == "History-India"
        user.update_attribute(:score1, 0)

      elsif params[:genre] == "History-Za Warudo"
        user.update_attribute(:score2, 0)
        
      elsif params[:genre] == "Games-Video Games"
        user.update_attribute(:score3, 0)
        
      elsif params[:genre] == "Games-Board Games"
        user.update_attribute(:score4, 0)
        
      end
    end 
    questions = Question.where(genre: params[:genre])
    @max = questions.length - 1
    if @max < 0
      flash[:danger] = "No questions available"
      redirect_to user_path(session[:user_id])
    end
    @quiz = questions[params[:id].to_i]
  end

  def check
    user_ans = params[:question][:opt1]+params[:question][:opt2]+params[:question][:opt3]+params[:question][:opt4]
    questions = Question.where(genre: params[:question][:genre])
    max = questions.length - 1
    correct_ans = questions[params[:question][:id].to_i].answer
    user = User.find(session[:user_id])
    if params[:question][:genre] == "History-India"
      user.update_attribute(:qid1, user.qid1+1)
    elsif params[:question][:genre] == "History-Za Warudo"
      user.update_attribute(:qid2, user.qid2+1)
    elsif params[:question][:genre] == "Games-Video Games"
      user.update_attribute(:qid3, user.qid3+1)
    elsif params[:question][:genre] == "Games-Board Games"
      user.update_attribute(:qid4, user.qid4+1)
    end
    if user_ans == correct_ans
      if params[:question][:genre] == "History-India"
        user.update_attribute(:score1, user.score1+100)

      elsif params[:question][:genre] == "History-Za Warudo"
        user.update_attribute(:score2, user.score2+100)
        
      elsif params[:question][:genre] == "Games-Video Games"
        user.update_attribute(:score3, user.score3+100)
        
      elsif params[:question][:genre] == "Games-Board Games"
        user.update_attribute(:score4, user.score4+100)
        
      end
    end
    if params[:question][:id].to_i < max
      redirect_to question_path(:genre => params[:question][:genre], :id => params[:question][:id].to_i+1)
    else
      if params[:question][:genre] == "History-India"
        user.update_attribute(:qid1, 0)
      elsif params[:question][:genre] == "History-Za Warudo"
        user.update_attribute(:qid2, 0)
      elsif params[:question][:genre] == "Games-Video Games"
        user.update_attribute(:qid3, 0)
      elsif params[:question][:genre] == "Games-Board Games"
        user.update_attribute(:qid4, 0)
      end
      redirect_to users_path
    end
  end

  def create
    @quiz = Question.new(question_params)
    if @quiz.save
      flash[:success] = "Created new question"
      redirect_to questions_url
    else
      render 'new'
    end
  end

  def index
  	@quiz = Question.where(genre: params[:genre])
  end

  def edit
  	@quiz = Question.find(params[:id])
  end

  def update
    @quiz = Question.find(params[:id])
    if @quiz.update_attributes(question_params)
      flash[:success] = "Question updated"
      redirect_to questions_url
    else
      render 'new'
    end
  end

  def destroy
  	Question.find(params[:id]).destroy
    flash[:success] = "Question deleted"
    redirect_to questions_url
  end

  private

    def question_params
      params.require(:question).permit(:question, :opt1, :opt2, :opt3, :opt4,
      	                                :answer, :genre, :subgenre)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      unless User.find(session[:user_id]).admin
      	flash[:danger] = "You can't do that"
      	@user = User.find(session[:user_id])
      	redirect_to @user
      end
    end
end
