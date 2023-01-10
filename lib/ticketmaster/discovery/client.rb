# frozen_string_literal: true

module Ticketmaster
  module Discovery
    class Client
      def initialize(client: ::Ticketmaster::Client.new)
        @client = client
      end

      def find_events(params)
        @client.send_request(:get, '/discovery/v2/events', params)
      end

      def get_event_details(params)
        @client.send_request(:get, '/discovery/v2/events', params)
      end
    end
  end
end
