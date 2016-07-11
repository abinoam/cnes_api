require "json"

class Api::CnesController < ApplicationController
  JSON_FILE = 'public/estabelecimentos.json'

  def index
    health_care = load_json JSON_FILE
    arr = []
    arr << health_care['COLUMNS']
    50.times do |i|
      arr << health_care['DATA'][i]
    end

    render json: arr
  end

  private
    ##
    # Lê os dados em JSON de um arquivo
    #
    ##
    def load_json(file_name)
      health_care_establishments_file = File.read file_name
      health_care_establishments = JSON.parse health_care_establishments_file
    end

    ##
    # Retorna um vetor com todos os estabelecimentos de saúde
    #
    ##
    def readHealthCareEstablishments
      
    end
end
