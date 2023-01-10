# frozen_string_literal: true

require_relative './app_schema'

module Ticketmaster
  module Schemas
    class EventDetails < Ticketmaster::Schemas::AppSchema
      define do
        optional(:locale).filled(:string)
        optional(:domain).filled(:string)
      end
    end
  end
end
