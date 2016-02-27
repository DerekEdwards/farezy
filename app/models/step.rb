class Step < ActiveRecord::Base
  #Associations
  belongs_to :task

  #Scopes
  default_scope { order('index ASC') }
end