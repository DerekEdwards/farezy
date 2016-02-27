class DayPass < ActiveRecord::Base
  belongs_to :city
  has_one :task

  #Scopes
  default_scope { order('days ASC') }
end