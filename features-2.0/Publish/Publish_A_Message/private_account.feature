# Please dont add any live links which directly redirects to their websites as automation will make may clicks and we will get blacklisted from their end
# Use the links which lavanya provides

@selenium @newui @current @publish_a_message
Feature: Publishing on a private account
  Background:
    Given I am an existing user 'autoqa'
    Given I login using page object
    Then I click on Publish button
    And I select Publish a message
# VH - 615

  Scenario: I can publish a message to a single source as a private org
    Then I add a message
    And I select 'facebook_page, twitter_account, tumblr_account' accounts
    Then I finish accounts selection
    And I test publish the message
#VH - 601
  Scenario: I can publish a message to wordpress in a private org
    Then I add a message
    And I select wordpress 'wordpress_blog' accounts
    Then I add a title to the wordpress blog 'Automate QA testing'
    Then I finish accounts selection
    And I test publish the message

  Scenario: I can publish a message with a preview attached single source as a private org
    Then I add a message with a link 'http://techcrunch.com/2015/01/21/whatsapp-comes-to-the-desktop/'
    And I select 'facebook_page, twitter_account, tumblr_account' accounts
    Then I finish accounts selection
    Then I preview the link
    And I am done with link preview
    And I test publish the message

  @production
  Scenario: I can publish a message with a shorten link attache as a private org
    Then I add a message with a link 'http://techcrunch.com/2015/01/21/whatsapp-comes-to-the-desktop/'
    And I wait for 8 seconds
    And I select 'facebook_page, twitter_account' accounts
    Then I finish accounts selection
    Then I shorten the link
    Then I publish the message
    Then I verify message with shortened link in calendar

  Scenario: I can publish a message with an un-shortened link  as a private org
    Given I click on Publish button
    When I add a message with a link 'http://techcrunch.com/2015/01/21/whatsapp-comes-to-the-desktop/'
    And I select 'facebook_page, twitter_account, tumblr_account' accounts
    And I finish accounts selection
    Then I test publish the message
    #And the link is shown on the sources web page


  #group publishing
  # VH-624
  Scenario: I can publish a message group as a private org
    Then I add a message
    And I select 'group_account' accounts
    Then I finish accounts selection
    And I test publish the message

  Scenario: I can publish a message with a preview attached as a private org
    Then I add a message with a link 'http://techcrunch.com/2015/01/21/whatsapp-comes-to-the-desktop/'
    And I select 'facebook_page, twitter_account, tumblr_account' accounts
    Then I finish accounts selection
    Then I preview the link
    And I am done with link preview
    And I test publish the message

  Scenario: I can publish a message with a shortened link attached  as a private org
    Then I add a message with a link 'http://techcrunch.com/2015/01/21/whatsapp-comes-to-the-desktop/'
    And I select 'group_account' accounts
    Then I finish accounts selection
    Then I shorten the link
    Then I publish the message
    Then I verify message with shortened link in calendar

  Scenario: I can publish a message with an un-shortened link as a private org
    Given I click on Publish button
    When I add a message with a link 'http://techcrunch.com/2015/01/21/whatsapp-comes-to-the-desktop/'
    When I select 'group_account' accounts
    And I finish accounts selection
    Then I test publish the message
    #And the link is shown on the sources web page
