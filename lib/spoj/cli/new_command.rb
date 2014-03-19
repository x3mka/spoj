#require 'active_support/core_ext/string'

module Spoj
  module CLI

    class NewCommand < Thor::Group
      include Thor::Actions

      desc 'Creates a new rails project with a vnoc store'
      argument :app_name, :type => :string, :desc => 'new application name'

      #class_option :page_size, :type => :numeric, :aliases => '-p', :default => 10,
      #             :desc => '# of problems per page'

      def self.source_root
        File.join(File.dirname(__FILE__),'templates')
      end

      def create_files
        template('spoj/config.yml', "#{app_name}/spoj/config.yml")
        template('spec/spec_helper.rb', "#{app_name}/spec/spec_helper.rb")
        template('Rakefile', "#{app_name}/Rakefile")
      end

      def banner
        say 'You application has been successfully created.'
      end

      private



    end

  end
end
