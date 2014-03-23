#require 'active_support/core_ext/string'

module Spoj
  module CLI

    class ListCommand < Thor::Group
      include Thor::Actions

      #desc 'Creates a new rails project with a vnoc store'
      #argument :app_path, :type => :string, :desc => 'rails app_path', :default => '.'

      # types: :string, :boolean

      class_option :page_size, :type => :numeric, :aliases => '-p', :default => 10,
                   :desc => '# of problems per page'

      def list
        puts 'Listing SPOJ classical problems...'
      end

      private

      def run_cmd
        inside @path do
          #say :create, @app_path
          #
          #rails_cmd = "rails new #{@app_path} --skip-bundle"
          #rails_cmd << " -m #{options[:template]}" if options[:template]
          #rails_cmd << " -d #{options[:database]}" if options[:database]
          #run(rails_cmd)
        end
      end

    end

  end
end
