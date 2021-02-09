@selenium @newui @current @sources
Feature: Add/Remove Topic Profiles
  
  Scenario: I can create a Topic Profile
    Given I am an existing user 'autoqa'
    And I login using page object
    Then I navigate to sources page
    And I click on Add new Source
    Then I click on 'Topic Profile' option
    And I enter a name for the Topic Profile
    And I enter '3' terms
    And I click on Create button for sources
    Then my topic should be visible
    Then I delete the Topic Profile created

  Scenario: I can create then delete a Topic Profile
    Given I am an existing user 'autoqa'
    And I login using page object
    Then I navigate to sources page
    And I click on Add new Source
    Then I click on 'Topic Profile' option
    And I enter a name for the Topic Profile
    And I enter '3' terms
    And I click on Create button for sources
    Then my topic should be visible
    Then I delete the Topic Profile created
    Then my topic should not be visible
  
  Scenario: I can add/remove random terms on a Topic Profile creation
    Given I am an existing user 'autoqa'
    And I login using page object
    Then I navigate to sources page
    And I click on Add new Source
    Then I click on 'Topic Profile' option
    And I enter a name for the Topic Profile
    And I enter '3' terms
    And I remove '2' terms
    And I click on Create button for sources
    Then my topic should be visible
    Then I delete the Topic Profile created
