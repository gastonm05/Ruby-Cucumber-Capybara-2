# Publishing to account groups with link shortening  and preview using bit.ly
#
@selenium @newui @current @publish_a_message @publish_a_message_bitly @new_regression
Feature: Publishing messages containing links with shortening and preview the links using bit.ly
  This publishing action will be to both private and public organizations

  Background:
    Given I am an existing user 'autoqa'
    Given I login using page object
    Given I select settings
    Given I select Personal Settings
    And I click on URL Shortening
    Then I can select 'bit.ly' as my default URL Shortening service
    Then I wait for 5 seconds
    Then I should see 'bit.ly' set as default URL Shortening service

  #VH-739
  Scenario: I can publish a message with shortened link using bit.ly to a private org
    Then I click on Publish button
    And I select Publish a message
    Then I add a message with a link 'https://utest-dl.s3.amazonaws.com/4777/3560/27369/null/bugAttachment/Bug677597_UpdateRoleWithBlankName.swf?AWSAccessKeyId=AKIAJVVOIXUIFRTEEEKQ&Expires=1466787379&Signature=Cqdni9bQdzK8x10TC9ip44%2BOxtM%3D'
    And I select 'facebook_page' accounts
    And I finish accounts selection
    And I wait for 5 seconds
    Then I shorten the link
    Then I preview the link
    And I am done with link preview
    Then I publish the message
    Then I verify message with shortened link in calendar
    #And I verify the published message on platforms
    #Then I verify the link in platform

  Scenario: I can publish a message with with shortened link using bit.ly to a public org
    Given I switch to 'Auto QA Beta' organization
    Then I click on Publish button
    And I select Publish a message
    Then I add a message with a link 'https://utest-dl.s3.amazonaws.com/4777/3560/27369/null/bugAttachment/Bug677472_DateFilterOnPublishedMessages.swf?AWSAccessKeyId=AKIAJVVOIXUIFRTEEEKQ&Expires=1466787404&Signature=EWHVX8qUaPDOgm9GoYM9GSiZmyQ%3D'
    And I select 'facebook_page' accounts
    Then I finish accounts selection
    And I wait for 5 seconds
    Then I shorten the link
    Then I preview the link
    And I am done with link preview
    Then I publish the message
    Then I verify message with shortened link in calendar
    #And I verify the published message on platforms
    #Then I verify the link in platform
  #################################################################################################################

   # Tests for public Organization VH QA ORG1

#################################################################################################################
#VH-757
#  edris.tabandeh
  Scenario: Publishing - publishing pins along with link using bitly to pinterest in a public org
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
#  VH-751
#  edris.tabandeh
  Scenario: Publishing - publishing pins along with link using bitly to pinterest
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