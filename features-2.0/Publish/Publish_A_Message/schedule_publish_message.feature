@selenium @newui @current @sandbox @publish_a_message
Feature: scheduling message

  Background: Schedule a message on a private account
    Given I am an existing user 'autoqa'
    Given I login using page object
    Given I select settings
    Given I select Personal Settings
    And I click on URL Shortening
    Then I can select 'bit.ly' as my default URL Shortening service
    Then I wait for 5 seconds
    Then I should see 'bit.ly' set as default URL Shortening service
    Then I click on Publish button
    And I select Publish a message

  Scenario: Schedule a message with a link to a private account
    Then I logout using newui
    Given I am an existing user 'autoqa'
    Given I login using page object
    Then I click on Publish button
    And I select Publish a message
    Then I add a message with a link 'http://techcrunch.com/2015/01/21/whatsapp-comes-to-the-desktop/'
    And I wait for 8 seconds
    And I select 'facebook_page' accounts
    Then I finish accounts selection
    Then I schedule the message
    Then I verify the message in calendar

  Scenario: Schedule a message for today with link preview
    Then I logout using newui
    Given I am an existing user 'autoqa'
    Given I login using page object
    Then I click on Publish button
    And I select Publish a message
    Then I add a message with a link 'https://utest-dl.s3.amazonaws.com/4777/3560/27369/null/bugAttachment/Bug676935_DeleteAllBrokenFurnace.swf?AWSAccessKeyId=AKIAJVVOIXUIFRTEEEKQ&Expires=1466787524&Signature=L9CF4SFoyJVV6w26Z2iauNVD7UU%3D'
    When I select 'group_account' accounts
    And I finish accounts selection
    And I wait for 5 seconds
    Then I shorten the link
    And I wait for 5 seconds
    Then I schedule the message
    Then I verify the message in calendar
#vh - 300
  Scenario: Schedule a message tomorrow and notifcation verification
    Then I logout using newui
    Given I am an existing user 'autoqa'
    Given I login using page object
    Then I click on Publish button
    And I select Publish a message
    Then I add a message with a link 'https://utest-dl.s3.amazonaws.com/4777/3560/27369/null/bugAttachment/Bug676935_DeleteAllBrokenFurnace.swf?AWSAccessKeyId=AKIAJVVOIXUIFRTEEEKQ&Expires=1466787524&Signature=L9CF4SFoyJVV6w26Z2iauNVD7UU%3D'
    When I select 'group_account' accounts
    And I finish accounts selection
    And I wait for 5 seconds
    Then I shorten the link
    And I wait for 5 seconds
    Then I schedule the message tomorrow
    And I wait for 60 seconds
    Then I verify the message in calendar on tomorrow
