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
end
