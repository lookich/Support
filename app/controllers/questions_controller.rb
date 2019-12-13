class QuestionsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  def index
    @questions = Question.order('created_at DESC')

    respond_to do |format|
      format.html
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    respond_to do |format|
      if @question.valid? and user_signed_in?
        @question.user_id = current_user.id
        @question.author = current_user.name
        @question.save
        format.html { redirect_to questions_url }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

end
