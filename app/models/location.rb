class Location < ActiveRecord::Base
  belongs_to :health_care_establishment
  has_one :coordinate

  # raio da terra metros
  EARTH_RADIUS = 6.371e6

  ##
  # Calcula a distância entre dois pontos
  def Location.distance(pointA, pointB, radius)
    Math.to_radians
  end
end
