class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    @answer.user = current_user
    @answer.save
    redirect_to question_path(@question)
  end

  # def create
  #   @question = Question.new(question_params)
  #   @question.user = current_user
  #   respond_to do |format|
  #     if @question.save
  #       format.html { redirect_to @question, notice: 'Question was successfully created.' }
  #       format.json { render :show, status: :created, location: @question }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @question.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end



  private
    def answer_params
      params.require(:answer).permit(:body)
    end
end
