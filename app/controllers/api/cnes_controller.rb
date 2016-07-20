require "json"

class Api::CnesController < ApplicationController
  JSON_FILE = 'public/estabelecimentos.json'

  def index
    render json: readHealthCareEstablishments.first(100), include: json_options
    
  end

  def setup

  end

  private
    ##
    # Lê os dados em JSON de um arquivo
    #
    ##
    def load_json(file_name)
      health_care_establishments_file = File.read file_name
      health_care_establishments = JSON.parse health_care_establishments_file
      health_care_establishments['DATA']
    end

    ##
    # Define opções de saída JSON da API
    #
    ##
    def json_options
      {
        location: {
          include: [
            coordinate: {
              except: [:id, :update_at, :created_at]
              }
          ],
          except: [:health_care_establishment_id]
        },

        administrative: {

        },

        teaching_activity: {

        },

        organization_kind: {
          except: [:created_at, :updated_at, :health_care_establishment_id]
        },

        health_unity: {

        }
      }
    end

    ##
    # Retorna um vetor com todos os estabelecimentos de saúde
    #
    ##
    def readHealthCareEstablishments
      health_care_establishments = load_json(JSON_FILE)

      # Um vetor com todos os estabelecimentos de saúde
      establishments = []
      health_care_establishments.each do |e|

        hce = HealthCareEstablishment.new(
                  cnes_code: e[0],
                  cnpj: e[1],
                  company_name: e[2],
                  fantasy_name: e[3],
                  phone: e[9],
                  fax: e[10],
                  email: e[11]
                )

        hce.build_location(
          street: e[4],
          street_number: e[5],
          complement: e[6],
          county: e[7],
          zipcode: e[8],
        )

        hce.location.build_coordinate(
          latitude: e[12],
          longitude: e[13],
          last_update: e[14]
        )

        hce.build_administrative id: e[15], kind: e[16]
        hce.build_teaching_activity id: e[17], activity: e[18]
        hce.build_organization_kind id: e[19], kind: e[20]
        hce.build_health_unity id: e[21], description: e[22]

        establishments << hce
      end

      establishments
    end
end
