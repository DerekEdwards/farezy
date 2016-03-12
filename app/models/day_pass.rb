class DayPass < ActiveRecord::Base
  
  #Associations
  belongs_to :city
  has_one :task

  #Scopes
  default_scope { order('days ASC') }
end