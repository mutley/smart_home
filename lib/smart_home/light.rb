require 'faraday'
require 'json'
require 'pry'

module SmartHome

  API_URL = "http://localhost:3000/api/v1/lights"

  class Light
    attr_reader :id, :uuid, :strength

    def initialize(attributes)
      @id = attributes["id"]
      @uuid = attributes["uuid"]
      @strength = attributes["strength"]
    end

    def self.find(id)
      response = Faraday.get("#{API_URL}/#{id}")
      attributes = JSON.parse(response.body)
      new(attributes)
    end

    def self.all
      response = Faraday.get("#{API_URL}")
			lights = JSON.parse(response.body)
			lights.map { |attributes| new(attributes) }
    end

  end
end
