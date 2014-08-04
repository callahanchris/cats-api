class FeedbackController < ApplicationController
  def create
    if @cat = Cat.find(params[:cat_id])
      @feedback = Feedback.new(rating: params[:rating], cat_id: @cat.id)
      if @feedback.valid?
        @feedback.save
        render json: {"success" => "Thanks for rating this cat.", "status" => 201}
      else
        render json: {"errors" => @feedback.errors.full_messages, "status" => 406}
      end
    else
      render json: {"errors" => ["No cat found"], "status" => 406}
    end
  end 

  def show
    @feedback = Feedback.find(params[:id])
    render json: @feedback
  end

  def index
    @cat = Cat.find(params[:cat_id])
    @feedback = Feedback.where(cat_id: @cat.id)
    render json: @feedback.map(&:rating)
  end
end
