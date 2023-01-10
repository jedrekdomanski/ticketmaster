# frozen_string_literal: true

module Ticketmaster
  class Connection
    ROOT_URL = 'https://app.ticketmaster.com'
    DEFAULT_TIMEOUT = 15

    def initialize
      @connection = prepare_connection
    end

    def get(resource, params)
      response = make_request(resource, params)
      Response.new(response)
    end

    private

    def prepare_connection
      ::Faraday.new(url: ROOT_URL) do |connection|
        connection.request :json
        connection.response :json, { preserve_raw: true, content_type: /\bjson$/ }
        connection.response :logger, nil, { bodies: { request: true, response: false } } do |logger|
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

  private_constant :Connection

  class Client
    def initialize(connection: Connection.new)
      @connection = connection
    end

    def send_request(method, resource, options)
      params = build_request(options)
      @connection.send(method, resource, params)
    end

    private

    def build_request(options)
      options.merge(apikey: ENV.fetch('TICKETMASTER_API_KEY'))
    end
  end
end
