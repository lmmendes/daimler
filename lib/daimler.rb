require "daimler/version"
require "daimler/configuration"
require "daimler/request"
require "daimler/images"
require "daimler/client"

require 'rest-client'
require 'json'

require 'pry-byebug'

module Daimler
  extend Configuration

  def self.new(options = {})
    Client.new(options)
  end
end
