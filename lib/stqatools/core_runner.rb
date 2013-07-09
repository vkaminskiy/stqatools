require 'jenkins_api_client'
require 'yaml'

module Stqatools
  module CoreRunner
    # puts "Hello core runner"

    JENKINS_API_DIR = File.expand_path('~/.jenkins_api_client')
    JENKINS_API_CONFIG = File.join(JENKINS_API_DIR, 'login.yml')

   
    def self.disable_jobs(client, prefix)
      puts client.object_id
      jobs = @client.job.list(prefix)
    end

    def self.setup_jenkins_client
      if File.exists?(Stqatools::CoreRunner::JENKINS_API_CONFIG)
        begin
          @@jenkins_client = JenkinsApi::Client.new(YAML.load_file(Stqatools::CoreRunner::JENKINS_API_CONFIG))
        rescue Errno::EBADF, IOError
          retry
        end
      end
    
    @@jenkins_client
    end
  end
end
