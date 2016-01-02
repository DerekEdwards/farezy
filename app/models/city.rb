class City < ActiveRecord::Base
  has_one :fare
  has_one :day_pass
  has_one :week_pass
end
