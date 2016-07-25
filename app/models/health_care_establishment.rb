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

  scope :byName, lambda { |name|
    where("lower(company_name) LIKE '%#{name.downcase}%' " +
            "OR lower(fantasy_name) LIKE '%#{name.downcase}%'") unless name.blank?

  }

  scope :filter_administrative, lambda { |codes|
      joins(:administrative).where("administratives.id IN (?)", codes) unless codes.blank?
  }

  scope :filter_health_unities, lambda { |codes|
    joins(:health_unity).where("health_unities.code IN (?)", codes) unless codes.blank?
  }

end
