Feature: Bootstrap a new app for Spoj problems solving
  As an awesome ruby coder who wants to solve all Spoj problems
  I should be able to bootstrap new app and get support for RSpec

  Background:
    #Given I cd to "tmp"
    Given the directory "my_spoj" does not exist

  @announce
  Scenario: Bootstrap a new app from scratch
    When I successfully run `spoj new my_spoj`
    Then the following directories should exist:
      |my_spoj/spoj                      |
      |my_spoj/spec                      |
    And the following directories should not exist:
      |my_spoj/bin                       |
    And the following files should exist:
      |my_spoj/spec/spec_helper.rb                 |
    And the file "my_spoj/Rakefile" should match /bundler/
    When I cd to "my_spoj"
#    And I successfully run `rake -T -I../../lib`
#    Then the output should contain:
#    """
#    rake build    # Build spoj-0.0.1.gem into the pkg directory
#    """
#    And the output should not contain:
#    """
#    rake test          # Run tests
#    """
#    When I run `rake spec -I../../lib`
#    Then the exit status should be 0
#    And the output should contain:
#    """
#    1 example, 0 failures
#    """