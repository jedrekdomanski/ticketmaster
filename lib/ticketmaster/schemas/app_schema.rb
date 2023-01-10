# frozen_string_literal: true

require 'dry-schema'

module Ticketmaster
  module Schemas
    class AppSchema < Dry::Schema::Params
      define do
        config.validate_keys = true
        required(:apikey).filled(:string)
      end
    end
  end
end
