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

private

  def set_city
    @city = City.find(params[:id])
  end
end