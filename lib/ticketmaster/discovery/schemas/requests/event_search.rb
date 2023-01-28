# frozen_string_literal: true

module Ticketmaster
  module Discovery
    module Schemas
      module Requests
        EventSearch = Dry::Schema.Params(parent: ::Ticketmaster::BaseSchema) do
          optional(:id).filled(:string)
          optional(:keyword).filled(:string)
          optional(:attractionId).filled(:string)
          optional(:venueId).filled(:string)
          optional(:postalCode).filled(:string)
          optional(:latlong).filled(:string)
          optional(:radius).filled(:string)
          optional(:unit).filled(:string)
          optional(:source).filled(:string)
          optional(:locale).filled(:string)
          optional(:marketId).filled(:string)
          optional(:startDateTime).filled(:string)
          optional(:endDateTime).filled(:string)
          optional(:includeTBA).filled(:string)
          optional(:includeTest).filled(:string)
          optional(:size).filled(:string)
          optional(:page).filled(:string)
          optional(:sort).filled(:string)
          optional(:onsaleStartDateTime).filled(:string)
          optional(:onsaleEndDateTime).filled(:string)
          optional(:city).array(:str?)
          optional(:countryCode).filled(:string)
          optional(:stateStae).filled(:string)
          optional(:classificationName).array(:str?)
          optional(:classificationId).array(:str?)
          optional(:dmaId).filled(:string)
          optional(:localStartDateTime).array(:str?)
          optional(:localStartEndDateTime).array(:str?)
          optional(:startEndDateTime).array(:str?)
          optional(:publicVisibilityStartDateTime).array(:str?)
          optional(:preSaleDateTime).array(:str?)
          optional(:onsaleOnStartDate).filled(:string)
          optional(:onsaleOnAfterStartDate).filled(:string)
          optional(:collectionId).array(:str?)
          optional(:segmentId).array(:str?)
          optional(:segmentName).array(:str?)
          optional(:includeFamily).filled(:string)
          optional(:promoterId).filled(:string)
          optional(:genreId).array(:str?)
          optional(:subGenreId).array(:str?)
          optional(:typeId).array(:str?)
          optional(:subTypeId).array(:str?)
          optional(:geoPoint).filled(:string)
          optional(:preferredCountry).filled(:string)
          optional(:includeSpellcheck).filled(:string)
          optional(:domain).array(:str?)
        end
      end
    end
  end
end
