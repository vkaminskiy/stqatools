require 'pp'

module Stqatools
  class CloudAnalyzer
    GLOBAL_VAR = "Hello cloud Analyzer"
    @@clouds_data = {}
    
    def initialize
      @rest_config = Stqatools::rest_config
      puts "Connecting to Dashboard..."
      @client = RightApi::Client.new(:email => @rest_config[:user], :password => @rest_config[:pass], :account_id => '2901')
      load_clouds
      puts @@clouds_data
    end

    def load_clouds
      puts "Getting clouds..."
      response = @client.clouds.index
      i = 0
      while response[i] != nil
        @@clouds_data.merge!(response[i].show.links[0]["href"].scan(/\d+/)[0] => {"name" => response[i].name})
        i += 1 
      end

    end
  end
end
