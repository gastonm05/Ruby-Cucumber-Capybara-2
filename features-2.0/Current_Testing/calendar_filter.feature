######################################################################################################################

         # Verifying the Calendar filter

######################################################################################################################
@selenium @newui @cal @new_regression
Feature: A user should be able to filter messages on the calendar by source(s)

Background:
    Given I am an existing user 'autoqa'
    And I login using page object

#VH-765
Scenario: Filtering the messages by each platform and a single account
    Then I navigate to messages page
    Then I open the filter
    And I pick 'Twitter' as a navigation filter
    And I select 'twitter_account' account
    And I finish the filter selection
    Then I verify the messages are filtered by 'twitter_account'

#VH-766
Scenario: Filtering the messages by each platform and a single account
    Then I navigate to messages page
    Then I open the filter
    And I pick 'Facebook' as a navigation filter
    And I select 'facebook_page' account
    And I finish the filter selection
    Then I verify the messages are filtered by 'facebook_page'

#VH-767
Scenario: Filtering the messages by each platform and a single account
    Then I navigate to messages page
    Then I open the filter
    And I pick 'Tumblr' as a navigation filter
    And I select 'tumblr_account' account
    And I finish the filter selection
    Then I verify the messages are filtered by 'tumblr_account'

#VH-768
Scenario: Filtering the messages by each platform and a single account
    Then I navigate to messages page
    Then I open the filter
    And I pick 'Google+' as a navigation filter
    And I select 'g_plus_page' account
    And I finish the filter selection
    Then I verify the messages are filtered by 'g_plus_page'

#VH-769
Scenario: Filtering the messages by each platform and a single account
    Then I navigate to messages page
    Then I open the filter
    And I pick 'LinkedIn' as a navigation filter
    And I select 'linkedin_company_page' account
    And I finish the filter selection
    Then I verify the messages are filtered by 'linkedin_company_page'

#VH-770
Scenario: Filtering the messages by each platform and a single account
    Then I navigate to messages page
    Then I open the filter
    And I pick 'WordPress' as a navigation filter
    And I select 'wordpress_blog' account
    And I finish the filter selection
    Then I verify the messages are filtered by 'wordpress_blog'

#VH-771
Scenario: Filtering the messages by each platform and a single account
    Then I navigate to messages page
    Then I open the filter
    And I pick 'Pinterest' as a navigation filter
    And I select 'pinterest_account' account
    And I finish the filter selection
    Then I verify the messages are filtered by 'pinterest_account'

#VH-772
Scenario: Filtering the messages by each platform and a single account in a public org
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    Then I open the filter
    And I pick 'Twitter' as a navigation filter
    And I select 'twitter_account' account
    And I finish the filter selection
    Then I verify the messages are filtered by 'twitter_account'

#VH-773
Scenario: Filtering the messages by each platform and a single account in a public org
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    Then I open the filter
    And I pick 'Facebook' as a navigation filter
    And I select 'facebook_page' account
    And I finish the filter selection
    Then I verify the messages are filtered by 'facebook_page'

#VH-774
Scenario: Filtering the messages by each platform and a single account in a public org
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    Then I open the filter
    And I pick 'Tumblr' as a navigation filter
    And I select 'tumblr_account' account
    And I finish the filter selection
    Then I verify the messages are filtered by 'tumblr_account'

#VH-775
Scenario: Filtering the messages by each platform and a single account in a public org
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    Then I open the filter
    And I pick 'Google+' as a navigation filter
    And I select 'g_plus_page' account
    And I finish the filter selection
    Then I verify the messages are filtered by 'g_plus_page'

#VH-776
Scenario: Filtering the messages by each platform and a single account in a public org
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    Then I open the filter
    And I pick 'LinkedIn' as a navigation filter
    And I select 'linkedin_company_page' account
    And I finish the filter selection
    Then I verify the messages are filtered by 'linkedin_company_page'

#VH-777
Scenario: Filtering the messages by each platform and a single account in a public org
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    Then I open the filter
    And I pick 'WordPress' as a navigation filter
    And I select 'wordpress_blog' account
    And I finish the filter selection
    Then I verify the messages are filtered by 'wordpress_blog'

#VH-778
Scenario: Filtering the messages by each platform and a single account in a public org
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    Then I open the filter
    And I pick 'Pinterest' as a navigation filter
    And I select 'pinterest_account' account
    And I finish the filter selection
    Then I verify the messages are filtered by 'pinterest_account'

#VH-779
Scenario: Verifying the published messages by more than one platform and multiple accounts
	Then I navigate to messages page
    Then I open the filter
    And I pick 'Twitter' as a navigation filter
    And I select 'twitter_account' account
    And I select 'twitter_account2' account
    And I pick 'Facebook' as a navigation filter
    And I select 'facebook_page' account
    And I select 'facebook_page1' account
    And I finish the filter selection
    Then I verify the messages are filtered by 'twitter_account,twitter_account2,facebook_page,facebook_page1' accounts

#VH-780
Scenario: Verifying the published messages by more than one platform and multiple accounts in a public org
	Then I switch to 'VH QA Org 1' organization
	Then I navigate to messages page
    Then I open the filter
    And I pick 'Twitter' as a navigation filter
    And I select 'twitter_account' account
    And I select 'twitter_account2' account
    And I pick 'Facebook' as a navigation filter
    And I select 'facebook_page' account
    And I select 'facebook_page1' account
    And I finish the filter selection
    Then I verify the messages are filtered by 'twitter_account,twitter_account2,facebook_page,facebook_page1' accounts

#VH-781
Scenario:  Verifying the clear functionality of filter
	Then I navigate to messages page
    Then I open the filter
    And I pick 'WordPress' as a navigation filter
    And I select 'wordpress_blog' account
    And I pick 'LinkedIn' as a navigation filter
    And I select 'linkedin_company_page' account
    And I finish the filter selection
    Then I verify the messages are filtered by 'linkedin_company_page,wordpress_blog' accounts
    And I open the filter
    And I clear the filters
    And I finish the filter selection
    Then I verify messages are not filtered by 'linkedin_company_page,wordpress_blog'

#VH-782
Scenario: Verifying the search functionality of filter for sources selection with results
	Then I navigate to messages page
    Then I open the filter
    And I search for 'wordpress_blog' on filter search field
    Then I should see 'wordpress_blog' as an account to filter

#VH-782
Scenario: Verifying the search functionality of filter for sources selection without results
	Then I navigate to messages page
    Then I open the filter
    And I search for 'dummy_value' on filter search field
    Then I should not see any filter entrie