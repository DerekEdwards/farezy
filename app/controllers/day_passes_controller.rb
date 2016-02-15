class DayPassesController < ApplicationController

  before_action :set_city_and_day_pass, only: [:update]

  def update
    #Update City Attributes
    puts params.ai
    new_attributes = {days: params[:days], cost: params[:cost]}
    @day_pass.update_attributes(new_attributes)

    respond_to do |format|
      format.json { render json: {result: 200}}
    end
  end


  private

  def set_city_and_day_pass
    @city = City.find(params[:city_id])
    @day_pass = DayPass.find(params[:id])
  end

end
