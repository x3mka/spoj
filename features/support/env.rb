require 'aruba/cucumber'
require 'aruba/in_process'

require 'spoj/cli'

Aruba::InProcess.main_class = Spoj::CLI::Runner
Aruba.process = Aruba::InProcess



PROJECT_ROOT = File.join(File.dirname(__FILE__),'..','..')
ARUBA_DIR = File.join(%w(tmp aruba))

Before do
  #@dirs = [ARUBA_DIR]
  #@puts = true
  #@aruba_timeout_seconds = 60
end

After do
end