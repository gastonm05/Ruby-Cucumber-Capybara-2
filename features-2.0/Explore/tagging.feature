
###################################################################################################################

        # Verifying the explore functionality of tagging for private account

###################################################################################################################

Feature: Verifying the explore functionality of tagging

  Background:
    Given I am an existing user 'autoqa'
    And I login using page object
    And I navigate to explore


  Scenario: Tagging a post in stream
    When I navigate to explore
    And I enter "Automation" keyword to search
    And I select twitter from dropdown
    Then I click on search
    Then I select a post
    And I change the tags from more dropdown
    And I add a tag as 'auto verify Pub exp'
    And I change the tag successfully
    Then I see the tag on post


###################################################################################################################

    ## Tests for public Organization Auto QA Beta

###################################################################################################################

  Scenario: Tagging a post in stream
    Then I switch to 'Auto QA Beta' organization
    When I navigate to explore
    And I enter "Automation" keyword to search
    And I select twitter from dropdown
    Then I click on search
    Then I select a post
    And I change the tags from more dropdown
    And I add a tag as 'auto verify Pub exp'
    And I change the tag successfully
    Then I see the tag on post