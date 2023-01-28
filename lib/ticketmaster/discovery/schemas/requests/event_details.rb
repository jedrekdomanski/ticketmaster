# frozen_string_literal: true

module Ticketmaster
  module Discovery
    module Schemas
      module Requests
        EventDetails = Dry::Schema.Params(parent: ::Ticketmaster::BaseSchema) do
          optional(:id).filled(:string)
          optional(:locale).filled(:string)
          optional(:domain).array(:string)
        end
      end
    end
  end
end
