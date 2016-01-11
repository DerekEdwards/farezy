class DayPass < ActiveRecord::Base
  belongs_to :city
  has_one :task
end