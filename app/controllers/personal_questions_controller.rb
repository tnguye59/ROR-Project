class PersonalQuestionsController < ApplicationController
  def new
  end

  def create
  	question = PersonalQuestion.new(personal_params)
  	if question.save 
  		redirect_to '/general'
  	else 
  		flash[:errors] = question.errors.full_messages
  		redirect_to :back
  	end 
  end

  private
  	def personal_params
  		params.require(:personal_question).permit(:q1,:q2,:q3, :user_id)
  	end
end
