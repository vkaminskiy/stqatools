require 'jenkins_api_client'
require 'yaml'
require 'pp'

module Stqatools
  module CoreRunner

    def self.disable_jobs(prefix)
      jobs = Stqatools::get_jenkins_client.job.list(prefix)
      pp jobs
    end

    def self.run_single_job(name)
      dash_client = Stqatools::CloudAnalyzer.new
      clouds = Stqatools::load_rocket_clouds
      pp clouds[:cloud_ids].class

      clouds[:cloud_ids].each do |key, id|
        n_key = key.sub("-","_")
        if name =~ /#{n_key}/
          pp dash_client.get_cloud_capacity(id.to_i)
        end
      end
    
    end
  end
end
