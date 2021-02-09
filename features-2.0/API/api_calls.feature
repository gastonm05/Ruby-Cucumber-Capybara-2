@selenium @api
Feature: APIs
  Background:
    Given I start testing API calls on 'staging'
    And I plan to test data integrity

  Scenario: I test sentiment related APIs
    Then I test 'sentiment' API
    Then I test 'sentiment_train' API
    Then I test 'social_intent' API

  Scenario: I test profile related APIs
    Then I test 'monitoring_profile' API

  Scenario: twitter related monitoring APIs
    Then I test 'monitoring_twitter_stats' API
    Then I test 'monitoring_twitter_trend' API
    Then I test 'monitoring_twitter_influencers' API

  Scenario: Facebook related monitoring APIs
    Then I test 'monitoring_facebook_stats' API
    Then I test 'monitoring_facebook_trend' API
    Then I test 'monitoring_facebook_mentions' API
