# frozen_string_literal: true

require 'pry'

module Ticketmaster
  class Connection
    ROOT_URL = 'https://app.ticketmaster.com'
    DEFAULT_TIMEOUT = 15

    def initialize
      @connection = prepare_connection
    end

    def get(resource, input)
      make_request(resource, input)
    end

    private

    def prepare_connection
      ::Faraday.new(url: ROOT_URL) do |connection|
        connection.request :json
        connection.options[:params_encoder] = Faraday::FlatParamsEncoder
        connection.response :json, { preserve_raw: true, content_type: /\bjson$/ }
        connection.response :logger, nil, bodies: { request: true, response: true } do |logger|
          logger.filter(/(apikey=)([^&]+)/, '\1[FILTERED]')
        end
        connection.options.timeout = DEFAULT_TIMEOUT
        connection.adapter Faraday.default_adapter
      end
    end

    def make_request(resource, params)
      @connection.get(resource) do |req|
        req.params = params
      end
    end
  end
end
