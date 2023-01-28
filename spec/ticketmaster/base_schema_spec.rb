# frozen_string_literal: true

RSpec.describe Ticketmaster::BaseSchema, :unit do
  it 'returns proper schema structure' do
    result = described_class.call({ apikey: 'asd' })

    expected_hash = { apikey: 'asd' }
    expect(result.to_h).to eq(expected_hash)
  end

  it 'is valid with required params' do
    result = described_class.call(apikey: 'asd')

    expect(result).to be_success
  end

  it 'is invalid without required params' do
    result = described_class.call({})
    expect(result).not_to be_success
    expect(result.errors(full: true).to_h).to include(apikey: ['apikey is missing'])
  end

  it 'is invalid with invalid params type' do
    result = described_class.call(apikey: 1234)
    expect(result).not_to be_success
    expect(result.errors(full: true).to_h).to include(apikey: ['apikey must be a string'])
  end
end
