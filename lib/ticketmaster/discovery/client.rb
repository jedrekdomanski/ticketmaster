# frozen_string_literal: true

module Ticketmaster
  module Discovery
    class Client
      def initialize(client: ::Ticketmaster::Client.new)
        @client = client
      end

      def find_events(options:)
        @client.send_request('/discovery/v2/events', options)
      end

      def get_event_details(options:)
        @client.send_request('/discovery/v2/events', options)
      end
    end
  end
end
