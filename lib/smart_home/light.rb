require 'faraday'
require 'json'

module SmartHome

  API_URL = "http://localhost:3001/api/v1/lights/active"

  class Light
    def self.find(id)
      response = Faraday.get("#{API_URL}/#{id}")
      attributes = JSON.parse(response.body)
    end
  end
end