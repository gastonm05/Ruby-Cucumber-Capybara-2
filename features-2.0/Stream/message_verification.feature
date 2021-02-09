@selenium @newui

Feature: Verify published message
  Background:
    Given I am an existing user 'autoqa'
    Given I login using page object

  @message_verification @new_regression
  Scenario: Published messages more than 15 mins ago should appear on the stream
    Then I verify the messages from redis published more than 30 mins ago
