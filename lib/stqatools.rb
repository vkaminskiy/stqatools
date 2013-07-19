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

  def self.load_config
  end

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

  @@rocket_clouds_loaded = false

  ROCKETMONKEY_CLOUDS_CONFIG_DIR = "#{File.expand_path('~')}/rocketmonkey".freeze
  ROCKETMONKEY_CLOUDS_CONFIG_FILE = File.join(Stqatools::ROCKETMONKEY_CLOUDS_CONFIG_DIR, ".rocketmonkey.clouds.yaml")

  def self.load_rocket_clouds
    if not @@rocket_clouds_loaded
      puts "Loading rocket monkey clouds"
      @@rocket_clouds = {}
      if File.exists?(Stqatools::ROCKETMONKEY_CLOUDS_CONFIG_FILE)
        begin
          @@rocket_clouds.merge!(YAML::load(IO.read(Stqatools::ROCKETMONKEY_CLOUDS_CONFIG_FILE))) || {}
        rescue Errno::EBADF, IOError
          retry
        end
      end
    end
    @@rocket_clouds_loaded = true
    @@rocket_clouds
  end

  @@jenkins_client_loaded = false

  JENKINS_API_DIR = File.expand_path('~/.jenkins_api_client')
  JENKINS_API_CONFIG = File.join(JENKINS_API_DIR, 'login.yml')
   
  def self.get_jenkins_client
    if not @@jenkins_client_loaded
      if File.exists?(Stqatools::JENKINS_API_CONFIG)
        begin
          @@jenkins_client = JenkinsApi::Client.new(YAML.load_file(Stqatools::JENKINS_API_CONFIG)) || {}
        rescue Errno::EBADF, IOError
          retry
        end
      end
    end
    @@jenkins_client_loaded = true
    @@jenkins_client
  end

end
