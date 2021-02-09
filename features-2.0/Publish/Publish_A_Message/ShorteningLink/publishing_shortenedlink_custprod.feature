# Publishing to account groups with link shortening  and preview using custom shortener "socialdata.tv" which has to be executed only with production

@selenium @newui @publish_a_message @production
Feature: Publishing messages containing links with shortening and preview the links using socialdata.tv
  This publishing action will be to both private and public organizations

  Background:
    Given I am an existing user 'autoqa'
    Given I login using page object
    Given I select settings
    Given I select Personal Settings
    And I click on URL Shortening
    Then I can customize 'socialdata.tv' as my default URL Shortening service
    Then I wait for 5 seconds
    Then I should see 'socialdata.tv' set as default URL Shortening service

  Scenario: I can publish a message with shortened link using socialdata.tv to a private org
    Then I click on Publish button
    And I select Publish a message
    When I select 'group_account' accounts
    And I finish accounts selection
    Then I add a message with a link using div locator 'https://utest-dl.s3.amazonaws.com/4777/3560/27369/null/bugAttachment/Bug676935_DeleteAllBrokenFurnace.swf?AWSAccessKeyId=AKIAJVVOIXUIFRTEEEKQ&Expires=1466787524&Signature=L9CF4SFoyJVV6w26Z2iauNVD7UU%3D'
    And I wait for 5 seconds
    Then I shorten the link
    Then I preview the link
    And I am done with link preview
    Then I publish the message
    Then I verify message with shortened link in calendar
    #And I verify the published message on platforms
    #Then I verify the link in platform

  Scenario: I can publish a message with with shortened link using socialdata.tv to a public org
    Given I switch to 'VH QA Org 1' organization
    Then I click on Publish button
    And I select Publish a message
    And I select 'group_account' accounts
    Then I finish accounts selection
    When I add a message with a link using div locator 'https://utest-dl.s3.amazonaws.com/4777/3560/27369/null/bugAttachment/Bug677597_UpdateRoleWithBlankName.swf?AWSAccessKeyId=AKIAJVVOIXUIFRTEEEKQ&Expires=1466787356&Signature=yXbUnUA4islFnuzCvk4vq64OldQ%3D'
    And I wait for 5 seconds
    Then I shorten the link
    Then I preview the link
    And I am done with link preview
    Then I publish the message
    Then I verify message with shortened link in calendar
    #And I verify the published message on platforms
    #Then I verify the link in platform
