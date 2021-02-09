@selenium @newui @current @publish_a_message
Feature: Publishing on a private account
  Background:
    Given I am an existing user 'autoqa'
    Given I login using page object
    Then I click on Publish button
    And I select Publish a message

      #VH - 669

  Scenario: I can save a message as a draft
    Then I add a message with a link 'http://techcrunch.com/2015/01/21/whatsapp-comes-to-the-desktop/'
    And I select 'group_account' accounts
    Then I finish accounts selection
    And I save it as a draft
    Then I should see it on Draft page
    Then I delete the draft message

    #VH - 490
  Scenario: I am able to edit a message draft and then publish
    Then I add a message with a link 'http://techcrunch.com/2015/01/21/whatsapp-comes-to-the-desktop/'
    And I select 'group_account' accounts
    Then I finish accounts selection
    And I save it as a draft
    Then I should see it on Draft page
    And I edit the draft
    Then I publish the message
    Then I verify the message in calendar
    #Then I verify the message in platform
