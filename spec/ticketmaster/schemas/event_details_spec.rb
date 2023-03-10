# frozen_string_literal: true

RSpec.describe Ticketmaster::Schemas::EventDetails, :unit do
  it 'returns proper schema structure' do
    schema = described_class.new

    result = schema.call(apikey: 'asd', id: 'testID', locale: 'EN', domain: 'zxc')

    expected_hash = { apikey: 'asd', id: 'testID', locale: 'EN', domain: 'zxc' }
    expect(result.to_h).to eq(expected_hash)
  end

  it 'is valid with only required params and without optional params' do
    schema = described_class.new

    result = schema.call(apikey: 'asd', id: 'testID')

    expect(result).to be_success
  end

  it 'is invalid without required params' do
    schema = described_class.new

    result = schema.call(locale: 'EN', domain: 'zxc')
    expect(result).not_to be_success
    expect(result.errors(full: true).to_h).to include(
      apikey: ['apikey is missing'],
      id: ['id is missing']
    )
  end

  it 'is invalid with empty optional params' do
    schema = described_class.new

    result = schema.call(apikey: 'asd', id: 'testID', locale: '', domain: 'dfg')
    expect(result).not_to be_success
    expect(result.errors(full: true).to_h).to include(locale: ['locale must be filled'])
  end

  it 'is invalid with invalid params type' do
    app_schema = described_class.new

    result = app_schema.call(apikey: 'asd', id: 1234)
    expect(result).not_to be_success
    expect(result.errors(full: true).to_h).to include(id: ['id must be a string'])
  end
end
