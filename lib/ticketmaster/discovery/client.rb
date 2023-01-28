# frozen_string_literal: true

module Ticketmaster
  module Discovery
    class Client
      InputValidationError = Class.new(StandardError)

      DISCOVERY_EVENTS_URL = '/discovery/v2/events'

      def initialize(
        client: ::Ticketmaster::Connection.new,
        event_search_schema: ::Ticketmaster::Discovery::Schemas::Requests::EventSearch,
        event_details_schema: ::Ticketmaster::Discovery::Schemas::Requests::EventDetails
      )
        @client = client
        @event_search_schema = event_search_schema
        @event_details_schema = event_details_schema
      end

      def find_events(params)
        input = build_event_search_input(params)
        make_request(DISCOVERY_EVENTS_URL, input)
      end

      # def get_event_details(params)
      #   input = @event_details_schema.call(params)
      #   @client.get('/discovery/v2/events', input)
      # end

      private

      def build_event_search_input(params)
        params.merge!(apikey: ENV.fetch('TICKETMASTER_API_KEY', nil))
        @event_search_schema.call(params)
      end

      def make_request(resource, input)
        validate_input(input)
        request(resource, input.to_h)
      end

      def validate_input(input)
        return if input.success?

        raise InputValidationError, input.errors(full: true).to_h
      end

      def request(resource, input)
        @client.get(resource, input)
      end
    end
  end
end
