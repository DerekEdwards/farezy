class DayPass < ActiveRecord::Base
  belongs_to :day_pass
  belongs_to :fare 
  has_one :task
end