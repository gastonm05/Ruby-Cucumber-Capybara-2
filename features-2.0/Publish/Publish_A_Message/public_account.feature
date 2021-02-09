# Please dont add any live links which directly redirects to their websites as automation will make may clicks and we will get blacklisted from their end
# Use the links which lavanya provides

# public org that has the sources from the remove/add feature file is called Auto QA Beta
# Auto QA Beta has campaign tracking called AutoQA, if tests will use the Auto QA org, it should change the campaign to AutoQA as well.
# it has a group called group_account that consists of twitter, facebook, google+, tumblr (wordpress blog requires title, needs added to test)


@selenium @newui @current @publish_a_message

Feature: Publishing on a public account
  Background:
    Given I am an existing user 'autoqa'
    Given I login using page object
    Then I switch to 'Auto QA Beta' organization
    Then I click on Publish button
    And I select Publish a message

  ####
  # shortened link scenarios
  ####

  Scenario: I can publish a message with a shorten link attached as a public org
    Then I add a message with a link 'http://techcrunch.com/2015/01/21/whatsapp-comes-to-the-desktop/'
    And I wait for 8 seconds
    And I select 'group_account' accounts
    Then I finish accounts selection
    Then I shorten the link
    Then I publish the message
    Then I verify message with shortened link in calendar

  Scenario: I can publish a message with a shorten link attached as a public org
    Then I add a message with a link 'http://techcrunch.com/2015/01/21/whatsapp-comes-to-the-desktop/'
    And I wait for 8 seconds
    And I select 'facebook_page' accounts
    Then I finish accounts selection
    Then I shorten the link
    Then I publish the message
    Then I verify message with shortened link in calendar

  Scenario: I can publish a message with a preview attached and a shortened link as a public org
    Then I add a message with a link 'http://techcrunch.com/2015/01/21/whatsapp-comes-to-the-desktop/'
    And I select 'facebook_page' accounts
    Then I finish accounts selection
    Then I shorten the link
    Then I preview the link
    And I wait for 5 seconds
    And I am done with link preview
    Then I test publish the message

  ####
  # Un-shortened link scenarios
  ####
  Scenario: I can publish a message with an un-shortened link as a public org
    When I add a message with a link 'http://techcrunch.com/2015/01/21/whatsapp-comes-to-the-desktop/'
    And I select 'group_account' accounts
    Then I finish accounts selection
    And I wait for 5 seconds
    Then I test publish the message

  Scenario: I can publish a message with an un-shortened link as a public org
    When I add a message with a link 'http://techcrunch.com/2015/01/21/whatsapp-comes-to-the-desktop/'
    And I select 'facebook_page' accounts
    Then I finish accounts selection
    And I wait for 5 seconds
    Then I test publish the message

  Scenario: I can publish a message with a preview attached, un-shortened link as a public org
    Then I add a message with a link 'http://techcrunch.com/2015/01/21/whatsapp-comes-to-the-desktop/'
    And I select 'facebook_page' accounts
    Then I finish accounts selection
    Then I preview the link
    And I wait for 5 seconds
    And I am done with link preview
    Then I test publish the message

  Scenario: I can publish a message with a preview attached, un-shortened link as a public org
    Then I add a message with a link 'http://techcrunch.com/2015/01/21/whatsapp-comes-to-the-desktop/'
    And I select 'facebook_page' accounts
    Then I finish accounts selection
    Then I preview the link
    And I wait for 5 seconds
    And I am done with link preview
    Then I test publish the message

  Scenario: I can publish a message to wordpress in a public org
    Then I add a message
    And I select wordpress 'wordpress_blog' accounts
    Then I add a title to the wordpress blog 'Automate QA testing'
    Then I finish accounts selection
    And I test publish the message
