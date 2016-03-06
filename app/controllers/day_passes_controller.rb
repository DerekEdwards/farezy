class DayPassesController < ApplicationController

  before_action :set_city_and_day_pass, only: [:update, :destroy]
  before_action :set_city, only: [:create]
  before_action :authenticate_user!

  def update
    #Update Day Pass
    new_attributes = {days: params[:days], cost: params[:cost]}
    @day_pass.update_attributes(new_attributes)

    respond_to do |format|
      format.json { render json: {result: 200}}
    end
  end

  def create
    #Create New Day Pass
    new_attributes = {days: params[:days], cost: params[:cost], city: @city}
    @day_pass = DayPass.create(new_attributes)
    @task = Task.create(day_pass: @day_pass)

    respond_to do |format|
      format.json { render json: {result: 200}}
    end
  end

  def destroy
    @day_pass.delete

    respond_to do |format|
      format.json { render json: {result: 200}}
    end
  end

  private

  def set_city_and_day_pass
    @city = City.find(params[:city_id])
    @day_pass = DayPass.find(params[:id])
  end

  def set_city
    @city = City.find(params[:city_id])
  end

end
