class CatsController < ApplicationController
  def show
    @cat = Cat.find(params[:id])
    render json: @cat.as_json
  end

  def index
    @cats = Cat.all
    render json: @cats.map(&:as_json)
  end
end
