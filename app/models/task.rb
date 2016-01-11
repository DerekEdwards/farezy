class Task < ActiveRecord::Base
  #Associations
  belongs_to :day_pass
  belongs_to :fare 
  has_many :steps

  #Methods

  def as_json
    steps_array = []
    self.steps.order('index').each do |step|
      steps_array << step.as_json
    end

    return {steps: steps_array}.as_json
  end

end