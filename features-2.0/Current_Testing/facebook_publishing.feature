######################################################################################################################

         # Verifying the facebook publishing functionalities like targeting, mentioning for private account

######################################################################################################################
#targeting will be available only for facebook pages
Feature: Facebook publishing using targeting and mentions

Background:
    Given I am an existing user 'autoqa'
    And I login using page object
    Given I select settings
    Given I select Personal Settings
    And I click on URL Shortening
    Then I can select 'bit.ly' as my default URL Shortening service
    Then I wait for 5 seconds
    Then I should see 'bit.ly' set as default URL Shortening service

Scenario: Publishing to a page using targeting parameters
  When I click on Publish button
  And I select Publish a message
  Then I select 'facebook_page' accounts
  And I finish accounts selection
  Then I add a message
  And I select facebook targeting
  Then I choose 'set1' in targeting
  And I am done with targeting set
  Then I publish the message
  Then I verify the message in calendar with targeting parameters set
  And I verify the published message on platforms
  And I verify the targeting parameters on platform message

Scenario: Publishing to a page and twitter using targeting parameters
  When I click on Publish button
  And I select Publish a message
  Then I select 'group_account' accounts
  And I finish accounts selection
  Then I add a message
  And I select facebook targeting
  Then I choose 'set2' in targeting
  And I am done with targeting set
  Then I publish the message
  Then I verify the message in calendar with targeting parameters set
  And I verify the published message on platforms
  And I verify the targeting parameters on platform message

Scenario: Publishing to a page by selecting targeting parameters and reseting all
  When I click on Publish button
  And I select Publish a message
  Then I select 'facebook_page' accounts
  And I finish accounts selection
  Then I add a message
  And I select facebook targeting
  Then I choose 'set1' in targeting
  Then I click on reset all
  And I observe that the parameters are reset
  Then I publish the message
  Then I verify the message in calendar with no targeting parameters set
  And I verify the published message on platforms
  And I verify that no targeting parameters on platform message

# Mentioning story - Sprint 4.0.29

Scenario: Publishing to a page with mentions
  When I click on Publish button
  And I select Publish a message
  Then I select 'facebook_page' accounts
  And I finish accounts selection
  Then I add 'mention1'
  And I select a user from dropdown
  And I add a message
  Then I publish the message
  Then I verify the message in calendar with user mentioned present
  And I verify the published message on platform with the mentioned user present

Scenario: Publishing to a twitter and FB page with mentions
  When I click on Publish button
  And I select Publish a message
  Then I select 'group_account' accounts
  And I finish accounts selection
  Then I add 'mention1'
  And I verify the dropdown has twitter and facebook users
  And I select a twitter user from dropdown
  Then I add 'mention2'
  And I verify the dropdown has twitter and facebook users
  And I select a facebook user from dropdown
  And I add a message
  Then I publish the message
  Then I verify the message in calendar with user mentioned present
  And I verify the published message on platforms with the mentioned user present

Scenario: Publishing to a group with link and mentions
  When I click on Publish button
  And I select Publish a message
  Then I select 'group_account' accounts
  And I finish accounts selection
  Then I add 'mention1'
  And I verify the dropdown has twitter and facebook users
  And I select a twitter user from dropdown
  Then I add 'mention2'
  And I verify the dropdown has twitter and facebook users
  And I select a facebook user from dropdown
  When I add a message with a link 'https://utest-dl.s3.amazonaws.com/4777/3560/27369/null/bugAttachment/Bug677597_UpdateRoleWithBlankName.swf?AWSAccessKeyId=AKIAJVVOIXUIFRTEEEKQ&Expires=1466787356&Signature=yXbUnUA4islFnuzCvk4vq64OldQ%3D'
  Then I shorten the link
  And I wait for 5 seconds
  Then I preview the link
  And I am done with link preview
  Then I publish the message
  Then I verify the message in calendar with user mentioned present
  And I verify the published message on platforms with the mentioned user present


Scenario: Verifying the dropdown functionality of a mention
  When I click on Publish button
  And I select Publish a message
  Then I select 'facebook_page' accounts
  And I finish accounts selection
  Then I add 'mention1'
  And I delete a character from mention1
  Then I see that the dropdown disappears

Scenario: Verifying the dropdown for character count
  When I click on Publish button
  And I select Publish a message
  Then I select 'facebook_page' accounts
  And I finish accounts selection
  Then I add 'mention1'
  And I add a character 't' to mention3
  Then I see that the dropdown updates
  And I select a user from dropdown
  And I add a message
  Then I publish the message
  Then I verify the message in calendar with user mentioned present
  And I verify the published message on platform with the mentioned user present

Scenario: Publishing to a group with mentions and verifying the mention functionality
  When I click on Publish button
  And I select Publish a message
  Then I select 'group_account' accounts
  And I finish accounts selection
  Then I add 'mention1'
  And I verify the dropdown has twitter and facebook users
  And I select a twitter user from dropdown
  Then I add 'mention2'
  And I verify the dropdown has twitter and facebook users
  And I select a facebook user from dropdown
  When I add a message with a link 'https://utest-dl.s3.amazonaws.com/4777/3560/27369/null/bugAttachment/Bug677597_UpdateRoleWithBlankName.swf?AWSAccessKeyId=AKIAJVVOIXUIFRTEEEKQ&Expires=1466787356&Signature=yXbUnUA4islFnuzCvk4vq64OldQ%3D'
  Then I shorten the link
  And I wait for 5 seconds
  Then I preview the link
  And I am done with link preview
  Then I select to Upload images
  And I select 'Image3' images by uploading
  And I select 'Image4' images by uploading
  And I enter the album name as 'Mentions'
  Then I finish image attach
  And I should be able to see the image attached
  Then I publish the message
  Then I verify the message in calendar with user mentioned present
  # I click on the mentioned user in the message, where it redirects to the specific mentioned user page.
  And I verify the mention navigation
  And I verify the published message on platforms with the mentioned user and images


# Repeating the same functionality to public org
  Scenario: Publishing to a page with mentions
    Then I switch to 'VH QA Org 2' organization
    When I click on Publish button
    And I select Publish a message
    Then I select 'facebook_page' accounts
    And I finish accounts selection
    Then I add 'mention1'
    And I select a user from dropdown
    And I add a message
    Then I publish the message
    Then I verify the message in calendar with user mentioned present
    And I verify the published message on platform with the mentioned user present

  Scenario: Publishing to a twitter and FB page with mentions
    Then I switch to 'VH QA Org 2' organization
    When I click on Publish button
    And I select Publish a message
    Then I select 'group_account' accounts
    And I finish accounts selection
    Then I add 'mention1'
    And I verify the dropdown has twitter and facebook users
    And I select a twitter user from dropdown
    Then I add 'mention2'
    And I verify the dropdown has twitter and facebook users
    And I select a facebook user from dropdown
    And I add a message
    Then I publish the message
    Then I verify the message in calendar with user mentioned present
    And I verify the published message on platforms with the mentioned user present

  Scenario: Publishing to a group with link and mentions
    Then I switch to 'VH QA Org 2' organization
    When I click on Publish button
    And I select Publish a message
    Then I select 'group_account' accounts
    And I finish accounts selection
    Then I add 'mention1'
    And I verify the dropdown has twitter and facebook users
    And I select a twitter user from dropdown
    Then I add 'mention2'
    And I verify the dropdown has twitter and facebook users
    And I select a facebook user from dropdown
    When I add a message with a link 'https://utest-dl.s3.amazonaws.com/4777/3560/27369/null/bugAttachment/Bug677597_UpdateRoleWithBlankName.swf?AWSAccessKeyId=AKIAJVVOIXUIFRTEEEKQ&Expires=1466787356&Signature=yXbUnUA4islFnuzCvk4vq64OldQ%3D'
    Then I shorten the link
    And I wait for 5 seconds
    Then I preview the link
    And I am done with link preview
    Then I publish the message
    Then I verify the message in calendar with user mentioned present
    And I verify the published message on platforms with the mentioned user present

  Scenario: Publishing to a group with mentions and verifying the mention functionality
    Then I switch to 'VH QA Org 2' organization
    When I click on Publish button
    And I select Publish a message
    Then I select 'group_account' accounts
    And I finish accounts selection
    Then I add 'mention1'
    And I verify the dropdown has twitter and facebook users
    And I select a twitter user from dropdown
    Then I add 'mention2'
    And I verify the dropdown has twitter and facebook users
    And I select a facebook user from dropdown
    When I add a message with a link 'https://utest-dl.s3.amazonaws.com/4777/3560/27369/null/bugAttachment/Bug677597_UpdateRoleWithBlankName.swf?AWSAccessKeyId=AKIAJVVOIXUIFRTEEEKQ&Expires=1466787356&Signature=yXbUnUA4islFnuzCvk4vq64OldQ%3D'
    Then I shorten the link
    And I wait for 5 seconds
    Then I preview the link
    And I am done with link preview
    Then I publish the message
    Then I verify the message in calendar with user mentioned present
# I click on the mentioned user in the message, where it redirects to the specific mentioned user page.
    And I verify the mention navigation
    And I verify the published message on platforms with the mentioned user present

#################################################################################################################

   # Tests for public Organization VH QA ORG2

#################################################################################################################

  Scenario: Publishing to a page using targeting parameters to public org
    Then I switch to 'VH QA Org 2' organization
    When I click on Publish button
    And I select Publish a message
    Then I select 'facebook_page' accounts
    And I finish accounts selection
    Then I add a message
    And I select facebook targeting
    Then I choose 'set1' in targeting
    And I am done with targeting set
    Then I publish the message
    Then I verify the message in calendar with targeting parameters set
    And I verify the published message on platforms
    And I verify the targeting parameters on platform message

  Scenario: Publishing to a page using targeting parameters
    Then I switch to 'VH QA Org 2' organization
    When I click on Publish button
    And I select Publish a message
    Then I select 'facebook_page' accounts
    And I finish accounts selection
    Then I add a message
    And I select facebook targeting
    Then I choose 'set2' in targeting
    And I am done with targeting set
    Then I publish the message
    Then I verify the message in calendar with targeting parameters set
    And I verify the published message on platforms
    And I verify the targeting parameters on platform message

  Scenario: Publishing to a page by selecting targeting parameters and reseting all
    Then I switch to 'VH QA Org 2' organization
    When I click on Publish button
    And I select Publish a message
    Then I select 'facebook_page' accounts
    And I finish accounts selection
    Then I add a message
    And I select facebook targeting
    Then I choose 'set1' in targeting
    Then I click on reset all
    And I observe that the parameters are reset
    Then I publish the message
    Then I verify the message in calendar with no targeting parameters set
    And I verify the published message on platforms
    And I verify that no targeting parameters on platform message
