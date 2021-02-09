######################################################################################################################

         # Verifying the facebook Settings functionalities

######################################################################################################################
@selenium @newui  @fg
Feature: Facebook page being added on personal and Org settings

Background:
    Given I am an existing user 'autoqa'
    And I login using page object

#VH-745
Scenario: Adding new facebook pages with search for mentioning
	Given I select settings
    And I select Personal Settings
    Then I click on Facebook
    Then I enter "Analyze" on the search box
    And I select "1" page on "new pages" section
    And I verify the page is on "existing pages" section

#VH-746
Scenario: Removing the facebook pages which is been added for mentioning
	Given I select settings
    And I select Personal Settings
    Then I click on Facebook
    And I select "1" page on "existing pages" section
    And I verify the page is not on "existing pages" section
#VH-748
Scenario: Verifying and validating the page search field in settings for added page
	Given I select settings
    And I select Personal Settings
    Then I click on Facebook
    Then I enter "Analyze" on the search box
    And I select "1" page on "new pages" section
    And I verify the page is on "existing pages" section
    And I refresh the page
    Then I enter "Analyze" on the search box for already added pages
    And I verify the page is on "existing pages" section
#VH-749
@1
Scenario: Verifying publishing a new page mention should get added to existing pages in settings
#first remove the page from the added pages
    Given I select settings
    And I select Personal Settings
    Then I click on Facebook
    Then I remove "Analyze_comp" from the added pages
    #Then I enter "Analyze_comp" on the search box for already added pages
    #And I remove "1" page on "existing pages" section if exists
    #And I verify the page is not on "existing pages" section
#Second write the message mentioning the already removed page
    When I click on Publish button
    And I select Publish a message
    Then I select 'facebook_page' accounts
    And I finish accounts selection
    Then I add 'analyze_comp' as mention
    And I select the option for mentioning
    Then I publish the message
#Verify on messages page that the message is there
    Then I navigate to messages page
    And I verify the message in calendar
#Verify message is on Stream
    Then I navigate to stream page
    #to get accurate results
    And I click on streams change filter
    And I click on 'facebook'
    And I verify the facebook message is on stream with 'analyze_comp' mention
#Verify page added to facebook mentioning pages
    Given I select settings
    And I select Personal Settings
    Then I click on Facebook
    And I verify the page is on "existing pages" section