class CitiesController < ApplicationController
  # GET /events
  # GET /events.json

  def index
    logger.info("Index Event")
    @cities = City.all
  end
end