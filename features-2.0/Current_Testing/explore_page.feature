
######################################################################################################################
# Core Explore automation.
######################################################################################################################

@selenium @newui @regression @regression_full @explore_page @new_regression
Feature: Edit/Remove comments in Explore or Stream

  Background:
    Given I am an existing user 'autoqa'
    Given I login using page object

#VH-788
  Scenario: An user should be able to search on twitter and results should reflect keyterms used
    When I navigate to explore
    And I enter "Automation" keyword to search
    And I select "Twitter" from dropdown
    Then I click on search
    Then Search results should reflect the keyword "Automation"
#VH-788
  Scenario: An user should be able to search twitter users and results should reflect keyterms used
    When I navigate to explore
    And I enter "vhqa1" keyword to search
    And I select "Twitter Users" from dropdown
    Then I click on search
    Then I see results containing the twitter user "vhqa1"
#VH-788
  Scenario: An user should be able to search on google+ and results should reflect keyterms used
    When I navigate to explore
    And I enter "Automation" keyword to search
    And I select "Google+" from dropdown
    Then I click on search
    Then Search results should reflect the keyword "Automation"
#VH-788
  Scenario: An user should be able to search on Instagram and results should reflect keyterms used
    When I navigate to explore
    And I enter "Automation" keyword to search
    And I select "Instagram" from dropdown
    Then I click on search
    Then Search results should reflect the keyword "Automation"
#VH-788
  Scenario: An user should be able to save a search on Explore
    When I navigate to explore
    And I enter "Automation" keyword to search
    And I select "Instagram" from dropdown
    Then I click on save button
    And I enter a random name for the search
    And I see the search name previously entered
#VH-788
  Scenario: An user should be able to open a saved search
    When I navigate to explore
    And I enter "Automation" keyword to search
    And I select "Instagram" from dropdown
    Then I click on save button
    And I enter a random name for the search
    And I see the search name previously entered
    And I navigate to saved searches and click on the created search
    And I see the search name previously entered
#VH-788
  Scenario: An user should be able to update a search saved on Explore
    When I navigate to explore
    And I enter "Automation" keyword to search
    And I select "Instagram" from dropdown
    Then I click on save button
    And I enter a random name for the search
    And I see the search name previously entered
    Then I click on save button
    And I update the search with a random name
    And I see the updated search name previously entered
#VH-788
  Scenario: An user should be able to delete a saved search
    When I navigate to explore
    And I navigate to Manage your searches page
    And I delete all the saved searches