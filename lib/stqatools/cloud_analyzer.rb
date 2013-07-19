require 'pp'

module Stqatools
  class CloudAnalyzer
    @@clouds_data = {}
    
    def initialize
      @rest_config = Stqatools::rest_config
      puts "Connecting to Dashboard..."
      @client = RightApi::Client.new(:email => @rest_config[:user], :password => @rest_config[:pass], :account_id => '2901')
      puts @client.object_id
      # load_clouds
      # pp @@clouds_data
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

    def get_cloud_capacity(cloud_id)
      puts "Getting cloud capacity..."
      puts cloud_id.class
      puts @client
      new_id = cloud_id.to_s
      puts new_id.class
      pp @client.clouds(:id => new_id).show.instances.index
    end

  end
end
