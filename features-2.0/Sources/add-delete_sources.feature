@selenium @newui
Feature: remove then re-add sources

# TODO: make these more robust and reliable

  Background:
    Given I am an existing user 'autoqa'
    Given I login using page object
    Then I navigate to sources page

  Scenario: I can connect LinkedIn account
    Given I connect my linkedin account
@fixme
  Scenario: I can connect twitter account
    Given I connect my twitter account using newui
  @fixme
  Scenario: I can connect facebook account
    Given I connect my facebook account using newui

  Scenario: I can connect google+ account
    Given I can connect my google+ account

  Scenario: I can connect Tumblr account
    Given I can connect my Tumblr account

  Scenario: I can connect Wordpress account
    Given I can connect my Wordpress account

  Scenario: I can connect Instagram account
    Given I can connect my Instagram account

  Scenario: Add linkedin sources to the public org
    Given I switch to 'Auto QA Beta' organization
    And I navigate to sources page
    Then I can connect my linkedin account
  @fixme
  Scenario: Add twitter sources to the public org
    Given I switch to 'Auto QA Beta' organization
    And I navigate to sources page
    Then I can connect my Twitter account to org
  @fixme
  Scenario: Add facebook sources to the public org
    Given I switch to 'Auto QA Beta' organization
    And I navigate to sources page
    Then I can connect my Facebook account to org

  Scenario: Add google+ sources to the public org
    Given I switch to 'Auto QA Beta' organization
    And I navigate to sources page
    Then I can add my google+ account to org

  Scenario: Add wordpress sources to the public org
    Given I switch to 'Auto QA Beta' organization
    And I navigate to sources page
    Then I can add my Wordpress account to org

  Scenario: Add tumblr sources to the public org
    Given I switch to 'Auto QA Beta' organization
    And I navigate to sources page
    Then I can add my Tumblr account to org
  @fixme
  Scenario: remove and re-create a group of sources in the public org
    Given I switch to 'Auto QA Beta' organization
    Then I click on Publish button
    And I select Publish a message
    And I select following accounts:
    | Account Name   | platform         |
    | testerfb11     | Twitter          |
    | Xom            | facebook         |
    Then I save as a group account called 'group_account'
    Then I finish accounts selection

#    Scenario: I can connect Foursquare account
#    Given I can connect my Foursquare account
#
## disable this
#  Scenario: Add foursquare sources to the public org
#    Given I switch to 'Auto QA Beta' organization
#    And I navigate to sources page
#    When I can connect my Foursquare account to org
#
## disable this
#  Scenario: Add instagram sources to the public org
#    Given I switch to 'Auto QA Beta' organization
#    And I navigate to sources page
#    And I can add my Instagram account to org


# Google+ LinkedIn, Instagram, Tumblr, Foursquare, Wordpress, Glassdoor, Yelp, Salesforce, SugarCRM, Desk.coom, ZenDesk
# list of creds and profiles are https://docs.google.com/spreadsheets/d/1mjThpI2Gg59s8IrafVe5th0f1SjjAqUwecpcxdOBAfQ/edit#gid=0

