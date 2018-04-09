require "faraday"

module Rl
  module Client
    extend self
    HOST = "https://api.github.com"

    def get path, params = {}
      connection.get do |request|
        request.url path
        request.params = params
        request.headers['Accept'] = "application/vnd.github.inertia-preview+json"
        request.headers['Authorization'] = "token #{access_token}"
      end
    end

    def connection
      @connection ||= Faraday.new(url: HOST) do |faraday|
        faraday.request :url_encoded
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
      end
    end

    private

    def access_token
      $container.resolve(:configuration).access_token
    end
  end
end
