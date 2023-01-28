# frozen_string_literal: true

RSpec.describe Ticketmaster::Discovery::Schemas::Requests::EventSearch, :unit do
  it 'returns proper schema structure' do
    input = {
      apikey: 'asd',
      id: 'testID',
      keyword: 'some_key_word',
      attractionId: 'id',
      venueId: 'test',
      postalCode: 'test',
      latlong: 'test',
      radius: 'test',
      unit: 'test',
      source: 'test',
      locale: 'test',
      marketId: 'test',
      startDateTime: 'test',
      endDateTime: 'test',
      includeTBA: 'test',
      includeTest: 'test',
      size: 'test',
      page: 'test',
      sort: 'test',
      onsaleStartDateTime: 'test',
      onsaleEndDateTime: 'test',
      city: 'test',
      countryCode: 'test',
      stateStae: 'test',
      classificationName: 'test',
      classificationId: 'test',
      dmaId: 'test',
      localStartDateTime: 'test',
      localStartEndDateTime: 'test',
      startEndDateTime: 'test',
      publicVisibilityStartDateTime: 'test',
      preSaleDateTime: 'test',
      onsaleOnStartDate: 'test',
      onsaleOnAfterStartDate: 'test',
      collectionId: 'test',
      segmentId: 'test',
      segmentName: 'test',
      includeFamily: 'test',
      promoterId: 'test',
      genreId: 'test',
      subGenreId: 'test',
      typeId: 'test',
      subTypeId: 'test',
      geoPoint: 'test',
      preferredCountry: 'test',
      includeSpellcheck: 'test',
      domain: 'test'
    }
    result = described_class.call(input)
    expect(result.to_h).to eq(input)
  end

  it 'is valid with only required params and without optional params' do
    result = described_class.call(apikey: 'asd')
    expect(result).to be_success
  end

  it 'is invalid without required params' do
    result = described_class.call(subGenreId: 'test')
    expect(result).not_to be_success
    expect(result.errors(full: true).to_h).to include(apikey: ['apikey is missing'])
  end

  it 'is invalid with empty optional params' do
    result = described_class.call(apikey: 'asd', id: '')
    expect(result).not_to be_success
    expect(result.errors(full: true).to_h).to include(id: ['id must be filled'])
  end

  it 'is invalid with invalid params type' do
    result = described_class.call(apikey: 'asd', id: 1234)
    expect(result).not_to be_success
    expect(result.errors(full: true).to_h).to include(id: ['id must be a string'])
  end
end
