require 'aruba/cucumber'
require 'aruba/in_process'

require 'spoj/cli'

#Aruba::InProcess.main_class = Spoj::CLI::Runner
#Aruba.process = Aruba::InProcess



PROJECT_ROOT = File.expand_path('../..',File.dirname(__FILE__))
ENV['PATH'] = "#{File.join(PROJECT_ROOT,'bin')}#{File::PATH_SEPARATOR}#{ENV['PATH']}"
ARUBA_DIR = File.join(%w(tmp aruba))

Before do
  #@dirs = [ARUBA_DIR]
  #@puts = true
  #@aruba_timeout_seconds = 60
end

After do
end