@selenium @newui @current @bulk
Feature: Bulk upload message with campaign tracking service
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

  Scenario: Bulk uploading with campaign tracking using google analytics
    When I click on Publish button
    And I select Bulk upload
    Then I select 'facebook_page' accounts
    And I finish accounts selection
    Then I generate the message in file 'bulk-uploading-template-done.csv' dynamically from 'bulk-uploading-template.csv'
    And I upload a csv file 'bulk-uploading-template-done.csv'
    Then I attach campaign tracking 'Campaign1' to the message
    Then I publish the message
    And I verify message with shortened link in calendar
    #And I verify the published message on platforms
    #And I verify the link in platform for campaign tracking

  Scenario: Bulk uploading with campaign tracking using custom service
    When I click on Publish button
    And I select Bulk upload
    Then I select 'facebook_page' accounts
    And I finish accounts selection
    Then I generate the message in file 'bulk-uploading-template-done.csv' dynamically from 'bulk-uploading-template.csv'
    And I upload a csv file 'bulk-uploading-template-done.csv'
    Then I attach campaign tracking 'Campaign2' to the message
    Then I publish the message
    And I verify message with shortened link in calendar
    #And I verify the published message on platforms
    #And I verify the link in platform for campaign tracking
