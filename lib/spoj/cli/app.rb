require 'thor'
require 'thor/group'

require_relative 'new_command'
require_relative 'list_command'

module Spoj
  module CLI
    class App < Thor

      desc 'version', 'Prints version'
      def version
        require_relative '../version'
        puts Spoj::VERSION #Gem.loaded_specs['spoj'].version
      end

      # register(class_name, subcommand_alias, usage_list_string, description_string)
      register(Spoj::CLI::NewCommand, 'new', 'new [APP_NAME]', 'Bootstrap new application')
      register(Spoj::CLI::ListCommand, 'list', 'list --sort=ACC', 'List SPOJ classical problems')

    end
  end
end
