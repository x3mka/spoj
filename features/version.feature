Feature: Version command
  As a user
  I should be able to see the current cli version

  @announce
  Scenario: Show the cli version
    When I run `spoj version`
    Then the output should contain "0.0.1"
    And the exit status should not be 0