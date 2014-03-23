require 'spec_helper'
require 'spoj/test_helpers'

describe Spoj::TestHelpers do

  let(:subject) { Class.new {extend Spoj::TestHelpers} }

  describe '#capture_stdout' do

    it 'should capture stdout' do
      subject::capture_stdout{print 'test'}.should == 'test'
    end

    it 'should capture multiline stdout' do
      subject::capture_stdout{puts 'test1';puts 'test2'}.should == "test1\ntest2\n"
    end

  end

  describe '#mock_stdin' do

    it 'should mock stdin' do
      input = nil
      subject::mock_stdin('test') do
        input = $stdin.gets
      end
      input.should == 'test'
    end

    it 'should mock multiline stdin' do
      s1 = s2 = nil
      subject::mock_stdin("test1\ntest2\n") do
        s1 = $stdin.gets.chomp
        s2 = $stdin.gets.chomp
      end
      s1.should == 'test1'
      s2.should == 'test2'
    end

  end

  describe '#expect_stdout' do

    it 'should assert stdout' do
      subject::expect_stdout('test') { print 'test' }
    end

  end

  describe '#expect_stdout_with_mocked_stdin' do

    it 'should assert stdout with mocked stdin' do
      subject::expect_stdout_with_mocked_stdin('World','Hello, World!') do
        name = $stdin.gets
        print "Hello, #{name}!"
      end
    end

  end

end