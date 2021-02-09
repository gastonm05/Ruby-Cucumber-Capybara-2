@selenium @newui @current @publishing @publish_template @regression @regression_full @new_regression
Feature: Create Publishing Message Templates
  Background:
    Given I am an existing user 'autoqa'
    Given I login using page object
    Given I select settings
    Given I select Personal Settings

  Scenario: I can create a new template
    When I click on Templates
    Then I click on Create Template
    When I add message to the template with a random name
    Then I can see my template being created
    Then I clear all the templates created
