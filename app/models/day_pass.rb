class DayPass < ActiveRecord::Base
  
  #Associations
  belongs_to :city
  has_one :task

  #Scopes
  default_scope { order('days ASC') }

  #Methods
  def as_currency
    ActionController::Base.helpers.number_to_currency(self.cost)
  end
end