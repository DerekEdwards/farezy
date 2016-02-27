class StepsController < ApplicationController  

  before_action :set_city_and_day_pass_and_step, only: [:update, :destroy]
  before_action :set_city_and_day_pass, only: [:create]

  def update
    new_attributes = {index: params[:index], title: params[:title], body: params[:body]}
    @step.update_attributes(new_attributes)

    respond_to do |format|
      format.json { render json: {result: 200}}
    end
  end

  def create
    new_attributes = {index: params[:index], title: params[:title], body: params[:body], task: @day_pass.task}
    @step = Step.create(new_attributes)

    respond_to do |format|
      format.json { render json: {result: 200}}
    end
  end

  def destroy
    @step.delete

    respond_to do |format|
      format.json { render json: {result: 200}}
    end
  end

  private

  def set_city_and_day_pass_and_step
    @city = City.find(params[:city_id])
    @day_pass = DayPass.find(params[:day_pass_id])
    @step = Step.find(params[:id])
  end

  def set_city_and_day_pass
    @city = City.find(params[:city_id])
    @day_pass = DayPass.find(params[:day_pass_id])
  end

end