@selenium @newui @current @campaign_tracking @new_regression
Feature: Create campaign tracking on organization settings
  Background:
    Given I am an existing user 'autoqa'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Given I select settings
    Given I select 'VH QA Org 1' Settings
    And I click on URL Shortening
    #Then I can select 'bit.ly' as my default URL Shortening service
    #Then I wait for 5 seconds
    #Then I should see 'bit.ly' set as default URL Shortening service

  Scenario: Create a publishing campaign
    Given I select settings
    Then I select 'VH QA Org 1' Settings
    And I click on Campaigns
    And I add new publishing campaign
    And I select Google Analytics
    And I add parameters
    And I name the campaign tracking as 'QA2'
    And I click on save
    Then I should see 'QA2' campaign tracking being created
    Then I delete the campaign 'QA2'
