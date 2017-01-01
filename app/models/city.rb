class City < ActiveRecord::Base
 
  #Associatitions
  has_one :fare
  has_many :day_passes
  belongs_to :user

  #Scopes
  scope :published, -> { where(:published => true) }

  #Methods

  #Check to see what the best cost and method is (individual trips/day pass/weekpass)
  #TODO: This method is very rudimentary and does not allow for combining methods 
  #  (e.g., staying for 8 days does not consider getting a 1 week pass followed by a day pass)
  def best_fare(days, trips)
    best_cost = nil
    best_method = nil
    best_task = nil

    #individual trips
    if self.fare.present?
      best_cost = trips*self.fare.cost
      best_method = 0
      best_task = self.fare.task
    end

    self.day_passes.each do |day_pass|
      cost = (days.to_f/day_pass.days.to_f).ceil*day_pass.cost
      if cost < best_cost
        best_cost = cost
        best_method = day_pass.days
        best_task = day_pass.task
      end
    end

    return best_cost, best_method, best_method_text(best_method, best_cost), best_cost_text(best_method, best_cost), best_task

  end

  #Text Generators: 
  #Models should be able to describe themselves.
  #Text generators should be named as follows: <function>_text
  def best_method_text method, cost
    case method
    when 0
      return "You should get a " + self.card_name + " and make a deposit of " + ActionController::Base.helpers.number_to_currency(cost) + "."
    else
      return "You should get a " + self.card_name + " and load a " + method.to_s + "-day pass onto it."
    end
  end

  def best_cost_text method, cost
    case method
    when 0
      return ""
    else
      return "A " + method.to_s + "-day pass costs " + ActionController::Base.helpers.number_to_currency(cost) + "."
    end
  end

end
