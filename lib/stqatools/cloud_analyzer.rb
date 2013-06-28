module Stqatools
  class CloudAnalyzer
    GLOBAL_VAR = "Hello cloud Analyzer"
    
    def initialize
      rest_config = Stqatools::rest_config
      puts rest_config
    end


  end
end
