Feature: Bootstrap a new app for Spoj problems solving
  As an awesome ruby coder who wants to solve all Spoj problems
  I should be able to bootstrap new app and get support for RSpec

#  Background:
#    Given the directory "my_spoj" does not exist

  @announce
  Scenario: Bootstrap a new app from scratch
    When I successfully run `spoj new my_spoj`
    Then the following directories should exist:
      |my_spoj/spoj/problems                      |
    And the following directories should not exist:
      |my_spoj/bin                                |
    And the following files should exist:
      |my_spoj/.rspec                             |
      |my_spoj/Rakefile                           |
      |my_spoj/Gemfile                            |
      |my_spoj/spoj/config.yml                    |
      |my_spoj/spoj/problems/spec_helper.rb       |
    And the file "my_spoj/.rspec" should match /format nested/
    When I cd to "my_spoj"
#    And I successfully run `bundle install`
#    Then the output should contain:
#    """
#    Your bundle is complete!
#    Use `bundle show [gemname]` to see where a bundled gem is installed.
#    """
    And I successfully run `rake -T -I../../lib`
    Then the output should contain:
    """
    rake spec  # Run RSpec
    """
#    And the output should not contain:
#    """
#    rake test          # Run tests
#    """
    When I run `rake spec -I../../lib`
    Then the exit status should be 0
    And the output should contain:
    """
    0 examples, 0 failures
    """