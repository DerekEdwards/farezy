class Fare < ActiveRecord::Base
  #Associations
  belongs_to :city
  has_one :task
end