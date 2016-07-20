require "json"

class Api::CnesController < ApplicationController
  JSON_FILE = 'public/estabelecimentos.json'

  def index
    limit = params[:limit]

    if limit.nil?
      list = HealthCareEstablishment.all
    else
      list = HealthCareEstablishment.take(limit)
    end

    render json: list, include: json_options
  end

  def setup
    # cria os agregados dos hospitais
    OrganizationKind.create code: 1, kind: 'ADMINISTRACAO DIRETA DA SAUDE (MS,SES E SMS)'
    OrganizationKind.create code: 2, kind: 'ADMINISTRACAO DIRETA DE OUTROS ORGAOS MEC,MEX,MARINHA,ETC'
    OrganizationKind.create code: 3, kind: 'ADMINISTRACAO INDIRETA - AUTARQUIAS'
    OrganizationKind.create code: 4, kind: 'ADMINISTRACAO INDIRETA - FUNDACAO PUBLICA'
    OrganizationKind.create code: 6, kind: 'ADMINISTRACAO INDIRETA - ORGANIZACAO SOCIAL PUBLICA'
    OrganizationKind.create code: 7, kind: 'EMPRESA PRIVADA'
    OrganizationKind.create code: 8, kind: 'FUNDACAO PRIVADA'
    OrganizationKind.create code: 9, kind: 'COOPERATIVA'
    OrganizationKind.create code: 10, kind: 'SERVICO SOCIAL AUTONOMO'
    OrganizationKind.create code: 11, kind: 'ENTIDADE BENEFICENTE SEM FINS LUCRATIVOS'
    OrganizationKind.create code: 12, kind: 'ECONOMIA MISTA'
    OrganizationKind.create code: 13, kind: 'SINDICATO'

    Administrative.create code: 1, kind: 'FEDERAL'
    Administrative.create code: 2, kind: 'ESTADUAL'
    Administrative.create code: 3, kind: 'MUNICIPAL'
    Administrative.create code: 4, kind: 'PRIVADA'

    TeachingActivity.create code: 1, activity: 'UNIDADE UNIVERSITARIA'
    TeachingActivity.create code: 2, activity: 'UNIDADE ESCOLA SUPERIOR ISOLADA'
    TeachingActivity.create code: 3, activity: 'UNIDADE AUXILIAR DE ENSINO'
    TeachingActivity.create code: 4, activity: 'UNIDADE SEM ATIVIDADE DE ENSINO'
    TeachingActivity.create code: 5, activity: 'HOSPITAL DE ENSINO'

    HealthUnity.create code: 81, description: 'CENTRAL DE REGULACAO'
    HealthUnity.create code: 64, description: 'CENTRAL DE REGULACAO DE SERVICOS DE SAUDE'
    HealthUnity.create code: 69, description: 'CENTRO DE ATENCAO HEMOTERAPICA E OU HEMATOLOGICA'
    HealthUnity.create code: 70, description: 'CENTRO DE ATENCAO PSICOSSOCIAL'
    HealthUnity.create code: 61, description: 'CENTRO DE PARTO NORMAL - ISOLADO'
    HealthUnity.create code: 2, description: 'CENTRO DE SAUDE/UNIDADE BASICA'
    HealthUnity.create code: 36, description: 'CLINICA/CENTRO DE ESPECIALIDADE'
    HealthUnity.create code: 22, description: 'CONSULTORIO ISOLADO'
    HealthUnity.create code: 7, description: 'HOSPITAL ESPECIALIZADO'
    HealthUnity.create code: 5, description: 'HOSPITAL GERAL'
    HealthUnity.create code: 62, description: 'HOSPITAL/DIA - ISOLADO'
    HealthUnity.create code: 67, description: 'LABORATORIO CENTRAL DE SAUDE PUBLICA - LACEN'
    HealthUnity.create code: 4, description: 'POLICLINICA'
    HealthUnity.create code: 1, description: 'POSTO DE SAUDE'
    HealthUnity.create code: 73, description: 'PRONTO ATENDIMENTO'
    HealthUnity.create code: 21, description: 'PRONTO SOCORRO ESPECIALIZADO'
    HealthUnity.create code: 20, description: 'PRONTO SOCORRO GERAL'
    HealthUnity.create code: 68, description: 'SECRETARIA DE SAUDE'
    HealthUnity.create code: 77, description: 'SERVICO DE ATENCAO DOMICILIAR ISOLADO(HOME CARE)'
    HealthUnity.create code: 75, description: 'TELESSAUDE'
    HealthUnity.create code: 39, description: 'UNIDADE DE APOIO DIAGNOSE E TERAPIA (SADT ISOLADO)'
    HealthUnity.create code: 50, description: 'UNIDADE DE VIGILANCIA EM SAUDE'
    HealthUnity.create code: 15, description: 'UNIDADE MISTA'
    HealthUnity.create code: 42, description: 'UNIDADE MOVEL DE NIVEL PRE-HOSPITALAR NA AREA DE URGENCIA'

    list = readHealthCareEstablishments
    @count = list.size

    # salva todos os itens da lista
    list.each do |e|
      e.save
    end

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

        hce.administrative = Administrative.where(code: e[15]).first
        hce.teaching_activity = TeachingActivity.where(code: e[17]).first
        hce.organization_kind = OrganizationKind.where(code: e[19]).first
        hce.health_unity = HealthUnity.where(code: e[21]).first

        establishments << hce
      end

      establishments
    end
end
