# frozen_string_literal: true

require 'faraday'

require 'ticketmaster/version'
require 'ticketmaster/client'

base_directory = File.expand_path('./ticketmaster', File.dirname(__FILE__))
Dir.entries("#{base_directory}/schemas").each do |f|
  require "#{base_directory}/schemas/#{f}" if f.match(/rb$/)
end

module Ticketmaster
  class Error < StandardError; end
  # Your code goes here...
end
