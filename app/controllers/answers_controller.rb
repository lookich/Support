class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.author = current_user.name
    @answer.save
    redirect_to questions_url
  end

  private

  def answer_params
    params.require(:answer).permit(:question, :body)
  end
end
