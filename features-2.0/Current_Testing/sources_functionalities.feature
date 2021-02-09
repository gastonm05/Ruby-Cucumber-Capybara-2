####################################################################################################################

         # Verifying the sources page functionalities for private account

####################################################################################################################

@selenium @newui @tracked @regression_full
Feature: Sources functionalities such as dropdown

  Background:
    Given I am an existing user 'autoqa'
    And I login using page object


     Scenario: Verify "Tracked" option in dropdown for sources
     Then I navigate to sources page
     Then I click on dropdown for accounts
     And I select "Tracked" option
     # This results should contain the accounts which are tracked or in case if no accounts present
     # then it has to show "No Entries found" message.
     Then I verify the results

     Scenario: Verify "Untracked" option in dropdown for sources
     Then I navigate to sources page
     Then I click on dropdown for accounts
     And I select "Untracked" option
     Then I verify the results

     Scenario: Verify "Valid" option in dropdown for sources
     Then I navigate to sources page
     Then I click on dropdown for accounts
     And I select "Valid" option
     Then I verify the results

     Scenario: Verify "Invalid" option in dropdown for sources
     Then I navigate to sources page
     Then I click on dropdown for accounts
     And I select "Invalid" option
     Then I verify the results

     Scenario: Verify "All" option in dropdown for sources
     Then I navigate to sources page
     Then I click on dropdown for accounts
     And I select "All" option
     Then I verify the results


 #################################################################################################################

   # Tests for public Organization VH QA ORG1

 #################################################################################################################


     Scenario: Verify "Tracked" option in dropdown for sources on public Org
     Then I switch to 'VH QA Org 1' organization
     When I navigate to sources page
     Then I click on dropdown for accounts
     And I select "Tracked" option
         # This results should contain the accounts which are tracked or in case if no accounts present
         # then it has to show "No Entries found" message.
     Then I verify the results

     Scenario: Verify "Untracked" option in dropdown for sources on public Org
     Then I switch to 'VH QA Org 1' organization
     When I navigate to sources page
     Then I click on dropdown for accounts
     And I select "Untracked" option
     Then I verify the results

     Scenario: Verify "Valid" option in dropdown for sources on public Org
     Then I switch to 'VH QA Org 1' organization
     When I navigate to sources page
     Then I click on dropdown for accounts
     And I select "Valid" option
     Then I verify the results

     Scenario: Verify "Invalid" option in dropdown for sources on public Org
     Then I switch to 'VH QA Org 1' organization
     When I navigate to sources page
     Then I click on dropdown for accounts
     And I select "Invalid" option
     Then I verify the results

     Scenario: Verify "All" option in dropdown for sources on public Org
     Then I switch to 'VH QA Org 1' organization
     When I navigate to sources page
     Then I click on dropdown for accounts
     And I select "All" option
     Then I verify the results




