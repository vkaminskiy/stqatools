require 'yaml'
require 'right_api_client'

require "stqatools/version"
require 'stqatools/cloud_analyzer'
require 'stqatools/core_runner'

# Main module file of ST QA tools

module Stqatools

  @@rest_config_loaded = false

  REST_CONFIG_DIR = "#{File.expand_path('~')}/.rest_connection".freeze
  REST_CONFIG_FILE = File.join(Stqatools::REST_CONFIG_DIR, "rest_api_config.yaml")

  def self.rest_config
    if not @@rest_config_loaded
      puts "Loading rest connection config..."
      @@rest_connection_config = {}
      if File.exists?(Stqatools::REST_CONFIG_FILE)
        begin
          @@rest_connection_config.merge!(YAML::load(IO.read(Stqatools::REST_CONFIG_FILE))) || {}
        rescue Errno::EBADF, IOError
          retry
        end
      end
    end
    @@rest_config_loaded = true
    @@rest_connection_config
  end

end
