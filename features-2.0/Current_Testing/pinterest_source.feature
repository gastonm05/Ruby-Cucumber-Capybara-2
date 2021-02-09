@selenium @newui @pinterest @regression @regression_full

Feature: Adding and deleting the pinterest
  Background:
    Given I am an existing user 'autoqa'
    And I login using quick page object

# VH - 387
  Scenario: Adding the pinterest source from tracked source page
    Then I navigate to sources page
    When I click on Add new Source
    Then I select pinterest
    And I connect to pinterest using 'qavht1@gmail.com' and 'nji98uhb'
    Then I authorize the pinterest account
    And I verify the pinterest account in sources page has been 'reconnected'

    # VH - 389
  Scenario: Navigating to the platform
    Then I navigate to sources page
    When I select account 'autoqa0079'
    And I select view on platform for 'autoqa0079'

# VH - 386
  Scenario: Deleting the pinterest source
    Then I navigate to sources page
    When I select 'pinterest' from left menu
    And I delete 'autoqa0079' account
    And I verify the source has been deleted

# VH - 385
  Scenario: Adding the pinterest source
    Then I navigate to sources page
    When I select 'pinterest' from left menu
    When I click on Add new Source
    Then I select pinterest
    #And I connect to pinterest using 'qavht1@gmail.com' and 'nji98uhb'
    Then I authorize the pinterest account
    And I verify the pinterest account in sources page has been 'connected'
    And I delete 'Pinterest1' account
    And I verify the source has been deleted


######################################################################################################################

         # Verifying the pinterest account authorizing and unauthorizing from sources page in public org

######################################################################################################################
# VH - 391 is deleted from the suite since it execution requeries the user to have no sources and the automation of this could affect many tests

# VH - 392
  Scenario: Deleting the pinterest source
    Then I switch to 'VH QA Org 2' organization
    And I navigate to sources page
    When I select 'pinterest' from left menu
    And I delete 'autoqa0079' account
    And I verify the source has been deleted

# VH - 393
  Scenario: Adding the pinterest source
    Then I switch to 'VH QA Org 2' organization
    Then I navigate to sources page
    When I select 'pinterest' from left menu
    And I see that no accounts present
    When I click on Add new Sources button in the center of page
    When I select account 'autoqa0079'
    And I click on Add sources button when empty sources
    And I verify the pinterest account in sources page has been added

# VH - 394
  Scenario: Navigating to the platform
    Then I switch to 'VH QA Org 2' organization
    Then I navigate to sources page
    When I select account 'autoqa0079'
    And I select view on platform for 'autoqa0079'

