class CorrectsController < ApplicationController
  def new
    @correct = Correct.new
  end

  def create
    @answer = Answer.find(params[:answer_id])
    @correct = @answer.corrects.new(correct_params)
    @correct.author = current_user.name
    @correct.save
    redirect_to questions_url
  end

  def moderate
    @correct = Correct.find(params[:id])
    @correct.update_attributes(:moderate => true)
    redirect_to questions_url
  end

  private

  def correct_params
    params.require(:correct).permit(:answer, :body, :moderate)
  end
end
