# frozen_string_literal: true

require 'active_support/all'
require 'awesome_print'
require 'faraday'
require 'ticketmaster/base_schema'
require 'ticketmaster/connection'
require 'ticketmaster/response'
require 'ticketmaster/version'
require 'ticketmaster/discovery/client'
require 'ticketmaster/discovery/schemas/requests/event_details'
require 'ticketmaster/discovery/schemas/requests/event_search'

module Ticketmaster
  class Error < StandardError; end
  # Your code goes here...
end
