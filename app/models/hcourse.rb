class Hcourse < ActiveRecord::Base
  attr_accessible :name, :number
  has_many :courses 
end
