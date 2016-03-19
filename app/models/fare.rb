class Fare < ActiveRecord::Base
  #Associations
  belongs_to :city
  has_one :task

  #Methods
  def as_currency
    ActionController::Base.helpers.number_to_currency(self.cost)
  end
end