@selenium @newui @current @bulk
Feature: Bulk Message Uploading
  Background:
    Given I am an existing user 'autoqa'
    Given I login using page object
#VH-672 VH-670
  Scenario: Bulk uploading is working properly on private account to publish right now
    When I click on Publish button
    And I select Bulk upload
    And I select 'group_account' accounts
    Then I finish accounts selection
    Then I generate the message in file 'bulk-uploading-template-done.csv' dynamically from 'bulk-uploading-template.csv'
    And I upload a csv file 'bulk-uploading-template-done.csv'
    Then I click on schedule
    Then I verify the message in calendar
#VH-672 VH-670
  Scenario: Bulk uploading with a future date on private account
    When I click on Publish button
    And I select Bulk upload
    And I select 'group_account' accounts
    Then I finish accounts selection
    Then I generate a csv template file 'bulk_date_done.csv' from 'bulk_date_template.csv' to publish tomorrow
    And I upload a csv file 'bulk_date_done.csv'
    Then I click on schedule
    And I wait for 60 seconds
    Then I verify the message in calendar on tomorrow
#VH-672 VH-670
  Scenario: Bulk uploading is working properly on public account to publish right now
    When I switch to 'VH QA Org 1' organization
    Then I click on Publish button
    And I select Bulk upload
    And I select 'group_account' accounts
    Then I finish accounts selection
    Then I generate the message in file 'bulk-uploading-template-done.csv' dynamically from 'bulk-uploading-template.csv'
    And I upload a csv file 'bulk-uploading-template-done.csv'
    Then I click on schedule
    Then I verify the message in calendar
#VH-672 VH-670
  Scenario: Bulk upload to a public org on a future date
    When I switch to 'VH QA Org 1' organization
    Then I click on Publish button
    And I select Bulk upload
    And I select 'group_account' accounts
    Then I finish accounts selection
    Then I generate a csv template file 'bulk_date_done.csv' from 'bulk_date_template.csv' to publish tomorrow
    And I upload a csv file 'bulk_date_done.csv'
    Then I click on schedule
    And I wait for 60 seconds
    Then I verify the message in calendar on tomorrow
#VH-678 VH-635
  Scenario: Bulk upload - verify the 'Please select an account to schedule' functionality
    When I click on Publish button
    And I select Bulk upload
    Then I verify the schedule message is 'warning'
    When I select 'group_account' accounts
    And I finish accounts selection
    Then I verify the schedule message is 'ok'
    
#VH-673
  Scenario: Bulk upload - Format and rules displayed under Bulk Scheduling popup
    When I click on Publish button
    And I select Bulk upload
    Then I verify the format message is shown

#VH-671
  Scenario: Bulk upload - Appropriate validation message is displayed for Uploading empty csv file 
    When I click on Publish button
    And I select Bulk upload
    When I select 'group_account' accounts
    And I finish accounts selection
    And I upload a csv file 'empty.csv'
    Then I click on schedule
    And I verify the empty file is not allowed
