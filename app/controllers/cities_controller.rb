class CitiesController < ApplicationController
  # GET /events
  # GET /events.json

  before_action :set_city, only: [:show, :edit, :best_fare, :update]

  def index
    logger.info("Index Event")
    @cities = City.all.order(:name)
  end

  def show
  end

  def edit
  end

  def update
    
    new_attributes = {name: params[:name], note: params[:note], image_url: params[:image_url], font_color_hex: params[:font_color_hex], card_name: params[:card_name], map_url: params[:map_url]}
    @city.update_attributes(new_attributes)

    respond_to do |format|
      format.json { render json: {result: 200}}
    end

  end

  def best_fare

    @city = City.find(params[:id].to_i)
    days = params[:days].to_i
    trips = params[:trips].to_i

    cost, method, method_text, cost_text, task = @city.best_fare days, trips
    result = {cost: cost, method: method, method_text: method_text, cost_text: cost_text, task: task.as_json}

    respond_to do |format|
      format.json { render json: result.to_json }
    end
  end 

private

  def set_city
    @city = City.find(params[:id])
  end
end