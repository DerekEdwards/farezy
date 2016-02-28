class StepsController < ApplicationController  

  before_action :set_city_and_task_and_step, only: [:update, :destroy]
  before_action :set_city_and_task, only: [:create]

  def update
    new_attributes = {index: params[:index], title: params[:title], body: params[:body]}
    @step.update_attributes(new_attributes)

    respond_to do |format|
      format.json { render json: {result: 200}}
    end
  end

  def create
    new_attributes = {index: params[:index], title: params[:title], body: params[:body], task: @task}
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

  def set_city_and_task_and_step
    @city = City.find(params[:city_id])
    @task = Task.find(params[:task_id])
    @step = Step.find(params[:id])
  end

  def set_city_and_task
    @city = City.find(params[:city_id])
    @task = Task.find(params[:task_id])
  end

end