class City < ActiveRecord::Base
 
  #Associatitions
  has_one :fare
  has_one :day_pass
  has_one :week_pass

  #Constants
  INDIVIDUAL = 1
  DAY_PASS = 2
  WEEK_PASS = 3

  #Methods

  #Check to see what the best cost and method is (individual trips/day pass/weekpass)
  #TODO: This method is very rudimentary and does not allow for combining methods (e.g., staying for 8 days does not consider getting a 1 week pass followed by a day pass)
  def best_fare(days, trips)
    best_cost = nil
    best_method = nil

    #individual trips
    if self.fare.present?
      best_cost = trips*self.fare.cost
      best_method = City::INDIVIDUAL
    end

    #day pass
    if self.day_pass.present?
      cost = days*self.day_pass.cost
      if cost < best_cost
        best_cost = cost
        best_method = City::DAY_PASS
      end
    end

    #week pass
    if self.week_pass.present?
      cost = (days/7.0).ceil*self.week_pass.cost
      if cost < best_cost
        best_cost = cost
        best_method = City::WEEK_PASS
      end
    end

    return best_cost, best_method

  end

end
