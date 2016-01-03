class City < ActiveRecord::Base
 
  #Associatitions
  has_one :fare
  has_many :day_passes

  #Methods

  #Check to see what the best cost and method is (individual trips/day pass/weekpass)
  #TODO: This method is very rudimentary and does not allow for combining methods (e.g., staying for 8 days does not consider getting a 1 week pass followed by a day pass)
  def best_fare(days, trips)
    best_cost = nil
    best_method = nil

    #individual trips
    if self.fare.present?
      best_cost = trips*self.fare.cost
      best_method = 0
    end

    self.day_passes.each do |day_pass|
      cost = (days.to_f/day_pass.days.to_f).ceil*day_pass.cost
      if cost < best_cost
        best_cost = cost
        best_method = day_pass.days
      end
    end

    return best_cost, best_method

  end

end
