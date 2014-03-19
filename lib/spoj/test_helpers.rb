require 'stringio'

module Spoj
  module TestHelpers

    def capture_stdout
      stdout = $stdout
      $stdout = mock = StringIO.new
      yield
      mock.rewind
      mock.read
    ensure
      $stdout = stdout
    end

    def mock_stdin(input)
      stdin = $stdin
      $stdin = mock = StringIO.new(input)
      mock.rewind
      yield
      #mock.read
    ensure
      $stdin = stdin
    end

    def expect_stdout(expected)
      out = capture_stdout do
        yield
      end
      out.should == expected
    end

    def expect_stdout_with_mocked_stdin(input, output)
      expect_stdout(output) do
        mock_stdin(input) do
          yield
        end
      end
    end

  end

end