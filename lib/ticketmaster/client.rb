# frozen_string_literal: true

module Ticketmaster
  class Response
    def initialize(response)
      @response = response
    end

    def body
      @response.body
    end

    def raw_body
      @response.env[:raw_body]
    end

    def headers
      @headers ||= @response.headers
    end

    def rate_limit
      headers['rate-limit']
    end

    def rate_limit_available
      headers['rate-limit-available']
    end

    def rate_limit_over
      headers['rate-limit-over']
    end

    def rate_limit_reset
      headers['rate-limit-reset']
    end

    def status
      @response.status
    end
  end

  private_constant :Response

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
        connection.adapter :httpclient
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
    ConfigurationError = Class.new(StandardError)

    def initialize(client: Connection.new)
      @client = client
    end

    def send_request(resource, options)
      params = build_request(options)
      @client.get(resource, params)
    end

    private

    def build_request(options)
      options.merge(apikey: ENV.fetch('TICKETMASTER_API_KEY'))
    end
  end
end
