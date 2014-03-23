require_relative 'cli/app'

module Spoj
  module CLI

    # From Thor docs (Aruba in process integration): https://github.com/erikhuda/thor/wiki/Integrating-with-Aruba-In-Process-Runs
    class Runner
      # Allow everything fun to be injected from the outside while defaulting to normal implementations.
      def initialize(argv, stdin = STDIN, stdout = STDOUT, stderr = STDERR, kernel = Kernel)
        @argv, @stdin, @stdout, @stderr, @kernel = argv, stdin, stdout, stderr, kernel
      end

      def execute!
        exit_code = begin
          # Thor accesses these streams directly rather than letting them be injected, so we replace them...
          $stderr = @stderr
          $stdin = @stdin
          $stdout = @stdout

          # Run our normal Thor app the way we know and love.
          Spoj::CLI::App.start(@argv)

          # Thor::Base#start does not have a return value, assume success if no exception is raised.
          0
        rescue Exception => e
          # Proxy any exception that comes out of Thor itself back to stderr
          $stderr.write(e.message + "\n")

          # Exit with a failure code.
          1
        ensure
          # ...then we put them back.
          $stderr = STDERR
          $stdin = STDERR
          $stdout = STDERR
        end

        # Proxy our exit code back to the injected kernel.
        @kernel.exit(exit_code)
      end
    end

  end
end
