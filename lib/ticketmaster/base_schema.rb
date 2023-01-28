# frozen_string_literal: true

require 'dry-schema'

module Ticketmaster
  BaseSchema = Dry::Schema.Params do
    required(:apikey).filled(:string)
  end
end
