# frozen_string_literal: true

RSpec.describe Ticketmaster::Schemas::AppSchema, :utni do
  it 'returns proper schema structure' do
    app_schema = described_class.new

    input = { apikey: 'asd' }
    result = app_schema.call(input)

    expected_hash = { apikey: 'asd' }
    expect(result.to_h).to eq(expected_hash)
  end

  it 'is valid with required params' do
    app_schema = described_class.new

    result = app_schema.call(apikey: 'asd')

    expect(result).to be_success
  end

  it 'is invalid without required params' do
    app_schema = described_class.new

    result = app_schema.call({})
    expect(result).not_to be_success
    expect(result.errors(full: true).to_h).to include(apikey: ['apikey is missing'])
  end

  it 'is invalid with invalid params type' do
    app_schema = described_class.new

    result = app_schema.call(apikey: 1234)
    expect(result).not_to be_success
    expect(result.errors(full: true).to_h).to include(apikey: ['apikey must be a string'])
  end
end
