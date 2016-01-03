class CitiesController < ApplicationController
  # GET /events
  # GET /events.json

  before_action :set_city, only: [:show]

  def index
    logger.info("Index Event")
    @cities = City.all.order(:name)
  end

  def show
  end

  def best_fare

    puts params.ai
    city = City.find(params[:id].to_i)
    days = params[:days].to_i
    trips = params[:trips].to_i

    puts days
    puts trips

    cost, method, method_text, cost_text = city.best_fare days, trips
    result = {cost: cost, method: method, method_text: method_text, cost_text: cost_text}

    respond_to do |format|
      format.json { render json: result.to_json }
    end
  end 

private

  def set_city
    @city = City.find(params[:id])
  end
end