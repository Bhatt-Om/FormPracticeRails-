class QuestionsController < ApplicationController

  def index
    @questions = Question.all 
  end

  def show
  end

  def new
    @question = Question.new
    4.times { @question.answers.build }
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "You Create an Question"
      redirect_to questions_path 
    else
      flash[:error] = puts @question.errors.full_messagrs 
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private 

  def question_params
    params.require(:question).permit(:title, answers_attributes: [:id, :body, :_destroy])
  end
end
