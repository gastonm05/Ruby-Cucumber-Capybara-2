@selenium @newui @current @publishing

Feature: URL shortening service selection
  Background:
    Given I am an existing user 'autoqa'
    Given I login using page object
    Given I select settings
    Given I select Personal Settings

  Scenario: I can change default URL_shortening service to vrl.ht
    And I click on URL Shortening
    Then I can select 'vrl.ht' as my default URL Shortening service
    Then I wait for 5 seconds
    Then I should see 'vrl.ht' set as default URL Shortening service

  Scenario: I can change default URL_shortening service to bit.ly
    And I click on URL Shortening
    Then I can select 'bit.ly' as my default URL Shortening service
    Then I wait for 5 seconds
    Then I should see 'bit.ly' set as default URL Shortening service
