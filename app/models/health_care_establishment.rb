require "radians"

class HealthCareEstablishment < ActiveRecord::Base
  has_one :location
  belongs_to :administrative
  belongs_to :teaching_activity
  belongs_to :organization_kind
  belongs_to :health_unity

  ##
  # Retorna estabelecimentos de saude de acordo com uma localização e um raio
  #
  # Calcula e retorna todos os estabelecimentos de saúde dentro de um raio
  # fornecido em KM e por uma dada posição fornecida por latitude e longitude
  # A formulá de Harvest é usada para o calculo da distância
  ##
  scope :near, lambda { |latitude, longitude, radius|

    joins(location: [:coordinate]).first

  }

end
