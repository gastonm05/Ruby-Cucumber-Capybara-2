# Scope : Publish the message with link and without shortening
# Run Sources reauthorization feature file before any publishing activity
# Create an account group to test across all the platforms
# Publish in parallel to public org with private org

@selenium @newui @publish_a_message

Feature: Simple-Publishing

  Background:
    Given I am an existing user 'autoqa'
    Given I login using page object
    Then I click on Publish button
    And I select Publish a message

  Scenario: I can publish a message
    Then I add a message
    And I select 'group_account' accounts
    Then I finish accounts selection
    And I test publish the message

  Scenario:
    And I select following accounts:
      | Account Name   | platform         |
      | vhqa1          | Twitter          |
      | VH QA Page     | Linkedin Page    |
      | vhqa1-1       | Tumblr account   |
      | vhqa1-2       | Tumblr blog      |
      | vhqawordpress1 | Wordpress        |
    Then I save as a group account called 'group_account'
    #TODO need to remove this account after done with this Scenario
    Then I finish accounts selection

  #Scenario: Publishing a text and link and verify in messages page
  #  Given I click on publish
  #  And I select the account group 'group_account'
  #  And I enter the message 'Good Test' with the link 'http://google.com'
  #  Then I wait for 12 seconds and click on publish
  #  And I find the message in messages page
  #  And I find the message I published on the stream

