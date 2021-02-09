
# Please dont add any live links which directly redirects to their websites as automation will make may clicks and we will get blacklisted from their end
# Use the links which lavanya provides

  ###
  # placed these scenarios in the public/private feature files
  # this should be removed soon
  ###

@selenium @newui @current @sandbox @publish_a_message2 @publish_shortened @new_regression
Feature: Publishing messages containing links w/o shortening the links.
  This publishing action will be to both private and public organizations

  Background:
    Given I am an existing user 'autoqa'
    Given I login using page object

  Scenario: I can publish a message with an un-shortened link to a private org
    Then I click on Publish button
    And I select Publish a message
    When I add a message with a link 'http://techcrunch.com/2015/01/21/whatsapp-comes-to-the-desktop/'
    When I select 'group_account' accounts
    And I finish accounts selection
    Then I test publish the message
    #And I verify the published message on platforms
    #Then I verify the link in platform

  Scenario: I can publish a message with an un-shortened link to a public org
    Given I switch to 'Auto QA Beta' organization
    Then I click on Publish button
    And I select Publish a message
    When I add a message
    When I select 'facebook_page, twitter_account, tumblr_account' accounts
    Then I finish accounts selection
    Then I test publish the message
    #And I verify the published message on platforms

  Scenario: I can publish a message with a preview attached, un-shortened link to a private org
    Then I click on Publish button
    And I select Publish a message
    Then I add a message with a link 'http://techcrunch.com/2015/01/21/whatsapp-comes-to-the-desktop/'
    And I select 'facebook_page' accounts
    Then I finish accounts selection
    Then I preview the link
    And I wait for 5 seconds
    And I am done with link preview
    Then I test publish the message
    #And I verify the published message on platforms
    #Then I verify the link in platform

  Scenario: I can publish a message with a preview attached, un-shortened link to a public org
    Given I switch to 'Auto QA Beta' organization
    Then I click on Publish button
    And I select Publish a message
    Then I add a message with a link 'http://techcrunch.com/2015/01/21/whatsapp-comes-to-the-desktop/'
    And I select 'facebook_page' accounts
    Then I finish accounts selection
    Then I preview the link
    And I wait for 5 seconds
    And I am done with link preview
    Then I test publish the message
    #And I verify the published message on platforms
    #Then I verify the link in platform

  Scenario: I can publish the message with campaign tracking,un-shortened link to a public org
    #Then I switch to 'University Social Team' organization
    #Then I click on Publish button
    #And I select Publish a message
    #Then I add a message with a link 'http://techcrunch.com/2015/01/23/theres-a-big-difference-between-using-facebook-at-work-and-for-work/'
    #And I select 'group_account' accounts
    #Then I finish accounts selection
    #Then I attach campaign tracking to the message
    #Then I wait for 8 seconds
    #And I see the message published with campaign tracking
#################################################################################################################

   # Tests for public Organization VH QA ORG1

#################################################################################################################
#VH-759 ==> PUBLIC
#Login to cision.viralheat.com	Account : utest2/utest098
  Scenario: Publishing - Publishing pins along with link without shortening in a public org
    Then I switch to 'VH QA Org 1' organization
    Then I click on Publish button
    And I select Publish a message
    When I select account 'viralheatqatest' to publish
    Then I finish accounts selection
    Then I select to Upload image
    And I choose to attach an image "car.jpg" by uploading
    Then I finish image attach
    Then I enter board name for pinterest
    Then I add a message with a link 'http://techcrunch.com/2015/01/21/whatsapp-comes-to-the-desktop/'
    Then I publish the message
    And I wait for 6 seconds
    And I verify the published message along with link and pin
#    And I verify the published message on platforms
    And I wait for 6 seconds
    And I verify the published message is fetched in stream

######################################################################################################################

         # Verifying the pinterest publishing functionalities like targeting, mentioning for private account

######################################################################################################################
  #  VH-754 ==>PRIVATE
  #  edris.tabandeh
  Scenario: Publishing - Publishing pins along with link without shortening
    Then I click on Publish button
    And I select Publish a message
    When I select account 'viralheatqatest' to publish
    Then I finish accounts selection
    Then I select to Upload image
    And I choose to attach an image "dolph1.jpeg" by uploading
    Then I finish image attach
    Then I enter board name for pinterest
    Then I add a message with a link 'http://techcrunch.com/2015/01/21/whatsapp-comes-to-the-desktop/'
    Then I publish the message
    And I wait for 6 seconds
    And I verify the published message along with link and pin
#    And I verify the published message on platforms
    And I wait for 6 seconds
    And I verify the published message is fetched in stream