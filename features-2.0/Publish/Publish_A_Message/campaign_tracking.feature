@selenium @newui @current @publish_a_message
Feature: Campaign Tracking with google analytics and custom service
  Background:
    Given I am an existing user 'autoqa'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Given I select settings
    Given I select 'VH QA Org 1' Settings
    And I click on URL Shortening
    Then I can select 'bit.ly' as my default URL Shortening service
    Then I wait for 5 seconds
    Then I should see 'bit.ly' set as default URL Shortening service

  Scenario: Publishing a message with campaign tracking using google analytics
    When I click on Publish button
    And I select Publish a message
    Then I select 'facebook_page' accounts
    And I finish accounts selection
    Then I add a message with a link using div locator 'https://utest-dl.s3.amazonaws.com/4777/3560/27369/null/bugAttachment/Bug676935_DeleteAllBrokenFurnace.swf?AWSAccessKeyId=AKIAJVVOIXUIFRTEEEKQ&Expires=1466787524&Signature=L9CF4SFoyJVV6w26Z2iauNVD7UU%3D'
    And I wait for 5 seconds
    And I shorten the link
    Then I attach campaign tracking 'Campaign1' to the message
    Then I publish the message
    Then I verify message with shortened link in calendar
    #Then I verify the published message on platforms
    #Then I verify the link in platform for campaign tracking

  Scenario: Publishing a message with campaign tracking using Custom service
    When I click on Publish button
    And I select Publish a message
    Then I select 'facebook_page' accounts
    And I finish accounts selection
    Then I add a message with a link using div locator 'https://utest-dl.s3.amazonaws.com/4777/3560/27369/null/bugAttachment/Bug676935_DeleteAllBrokenFurnace.swf?AWSAccessKeyId=AKIAJVVOIXUIFRTEEEKQ&Expires=1466787524&Signature=L9CF4SFoyJVV6w26Z2iauNVD7UU%3D'
    And I wait for 5 seconds
    And I shorten the link
    Then I attach campaign tracking 'Campaign2' to the message
    Then I publish the message
    Then I verify message with shortened link in calendar
    #Then I verify the published message on platforms
    #Then I verify the link in platform for campaign tracking

#VH-741
  Scenario: Publishing a message with preview and campaign tracking using google analytics
    When I click on Publish button
    And I select Publish a message
    Then I select 'facebook_page' accounts
    And I finish accounts selection
    Then I add a message with a link using div locator 'https://utest-dl.s3.amazonaws.com/4777/3560/27369/null/bugAttachment/Bug676935_DeleteAllBrokenFurnace.swf?AWSAccessKeyId=AKIAJVVOIXUIFRTEEEKQ&Expires=1466787524&Signature=L9CF4SFoyJVV6w26Z2iauNVD7UU%3D'
    And I wait for 5 seconds
    And I shorten the link
    Then I preview the link
    And I am done with link preview
    Then I attach campaign tracking 'Campaign1' to the message
    Then I publish the message
    And I verify message with shortened link in calendar
    #And I verify the published message on platforms
    #And I verify the link in platform for campaign tracking
    #And I verify the preview link for campaign tracking

  Scenario: Publishing a message with preview and campaign tracking using custom service
    When I click on Publish button
    And I select Publish a message
    Then I select 'facebook_page' accounts
    And I finish accounts selection
    Then I add a message with a link using div locator 'https://utest-dl.s3.amazonaws.com/4777/3560/27369/null/bugAttachment/Bug676935_DeleteAllBrokenFurnace.swf?AWSAccessKeyId=AKIAJVVOIXUIFRTEEEKQ&Expires=1466787524&Signature=L9CF4SFoyJVV6w26Z2iauNVD7UU%3D'
    And I wait for 5 seconds
    And I shorten the link
    Then I preview the link
    And I am done with link preview
    Then I attach campaign tracking 'Campaign2' to the message
    Then I publish the message
    And I verify message with shortened link in calendar
    #And I verify the published message on platforms
    #And I verify the link in platform for campaign tracking
    #And I verify the preview link for campaign tracking
    #Then I verify the message in streams

  Scenario: Publishing with campaign tracking enabled in general settings
    And I select settings
    When I select 'VH QA Org 1' Settings
    Then I select General Settings
    Then I check the box for always attach campaign tracking
    Then I click on Publish button
    And I select Publish a message
    Then I select 'facebook_page' accounts
    And I finish accounts selection
    Then I add a message with a link using div locator 'https://utest-dl.s3.amazonaws.com/4777/3560/27369/null/bugAttachment/Bug676935_DeleteAllBrokenFurnace.swf?AWSAccessKeyId=AKIAJVVOIXUIFRTEEEKQ&Expires=1466787524&Signature=L9CF4SFoyJVV6w26Z2iauNVD7UU%3D'
    And I wait for 5 seconds
    Then I preview the link
    And I am done with link preview
    Then I publish the message
    And I verify message with shortened link in calendar
    #And I verify the published message on platforms
    #And I verify the link in platform for campaign tracking
    #And I verify the preview link for campaign tracking
    #Then I verify the message in streams

  Scenario: Publishing a message with campaign tracking and without link shortening using google analytics
    And I select settings
    When I select 'VH QA Org 1' Settings
    Then I select General Settings
    Then I uncheck the box for always attach campaign tracking
    When I click on Publish button
    And I select Publish a message
    Then I select 'facebook_page' accounts
    And I finish accounts selection
    Then I add a message with a link using div locator 'https://utest-dl.s3.amazonaws.com/4777/3560/27369/null/bugAttachment/Bug676935_DeleteAllBrokenFurnace.swf?AWSAccessKeyId=AKIAJVVOIXUIFRTEEEKQ&Expires=1466787524&Signature=L9CF4SFoyJVV6w26Z2iauNVD7UU%3D'
    And I wait for 5 seconds
    Then I preview the link
    And I am done with link preview
    Then I attach campaign tracking 'Campaign1' to the message
    Then I publish the message
    And I verify message with shortened link in calendar
    #And I verify the published message on platforms
    #And I verify the link in platform for campaign tracking
    #And I verify the preview link for campaign tracking

  Scenario: Publishing a message with preview and campaign tracking using custom service
    And I select settings
    When I select 'VH QA Org 1' Settings
    Then I select General Settings
    Then I uncheck the box for always attach campaign tracking
    When I click on Publish button
    And I select Publish a message
    Then I select 'facebook_page' accounts
    And I finish accounts selection
    Then I add a message with a link using div locator 'https://utest-dl.s3.amazonaws.com/4777/3560/27369/null/bugAttachment/Bug676935_DeleteAllBrokenFurnace.swf?AWSAccessKeyId=AKIAJVVOIXUIFRTEEEKQ&Expires=1466787524&Signature=L9CF4SFoyJVV6w26Z2iauNVD7UU%3D'
    And I wait for 5 seconds
    Then I preview the link
    And I am done with link preview
    Then I attach campaign tracking 'Campaign2' to the message
    Then I publish the message
    And I verify message with shortened link in calendar
    #And I verify the published message on platforms
    #And I verify the link in platform for campaign tracking
    #And I verify the preview link for campaign tracking
#################################################################################################################

   # Tests for public Organization VH QA ORG1

#################################################################################################################
#VH-755
#  edris.tabandeh
  Scenario: Publishing - publishing pins along with link using bitly and campaign tracking to pinterest
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