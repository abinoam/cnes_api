class Address < ActiveRecord::Base
  has_one :location
end
