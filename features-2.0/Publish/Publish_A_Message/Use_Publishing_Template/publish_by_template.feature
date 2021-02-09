@selenium @newui @current @publish_a_message @publish_template @regression @regression_full
Feature: Create Publishing Message Templates
  Background:
    Given I am an existing user 'autoqa'
    Given I login using page object
    Given I select settings
    Given I select Personal Settings
    When I click on Templates
    Then I click on Create Template
    When I add message to the template with a random name

    # VH - 580, VH - 578
  Scenario: I publish the message using templates

    Then I wait for 10 seconds
    Then I click on Publish button
    And I select Publish a message
    When I add a message with a link 'https://utest-dl.s3.amazonaws.com/4777/3560/77261/null/bugAttachment/Bug1594219_mark_as_in_stream_err.swf?AWSAccessKeyId=AKIAJVVOIXUIFRTEEEKQ&Expires=1472066094&Signature=8n%2B0%2BIKzINpXTo2mZmvE5VwVvzM%3D'
    And I select 'facebook_page' accounts
    Then I finish accounts selection
    And I select the template I just created
    Then I publish the message
    #Then I verify the message in platform
    Then I verify the message in calendar
    Then I go to template page
    Then I can see my template being created
    Then I clear all the templates created
