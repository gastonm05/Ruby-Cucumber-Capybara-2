#@author Adam Kauffman
@selenium @newui @regression
Feature: Use and alteration of streams

  Background:
    Given I am an existing user 'autoqa'
    And I login using page object

  #@author: Adam Kauffman
  #@Source VH-24
  #@Scenario  Verify user able to 'Follow' the Twitter post
  #test was sent back to Indian team for refactor
  @fixme
  Scenario: Verify user able to 'Follow' the Twitter post
    And I click on streams change filter
    And I click on twitter
    And I select the 'VH Testing Page' twitter account
    Then I click on the streams preview button

  #@author Adam Kauffman
  #@source VH-18
  #@scenario Verify can preview post which are related to the accounts selected from Mentions tab.
  @stream
  Scenario: Verify can preview post which are related to the accounts selected from Mentions tab.
    And I click on streams change filter
    And I click on advanced tab in the change filter panel
    And I click on twitter mentions on the change filter panel
    And I click on the 'vhqa2' account in mentions
    And I click on the streams preview button
    Then I scroll the stream results into view
    And I verify all visible stream results contain 'vhqa2' as the source
    And I verify the stream summary contains 'Your smart stream includes mentions for 1 source.'

  #@author Adam Kauffman
  #@source VH-17
  #@scenario Verify can preview post which has Lead intent
  @stream
  Scenario: Verify can preview post which has Lead intent
    And I click on streams change filter
    And I click on advanced tab in the change filter panel
    And I click on Sentiment & Intent on the change filter panel
    Then I click on Lead in the change filter panel
    And I click on the streams preview button
    Then I scroll the stream results into view
    And I verify the stream summary contains 'Your smart stream includes all of your Sources at this time which are sales leads.'
    And I verify all visible stream results contain the lead indicator

  #@author Adam Kauffman
  #@source VH-16
  #@scenario Verify can preview post which has Lead intent
  @stream
  Scenario: Verify can preview post which has Neutral sentiment
    And I click on streams change filter
    And I click on advanced tab in the change filter panel
    And I click on Sentiment & Intent on the change filter panel
    Then I click on Neutral in the change filter panel
    And I click on the streams preview button
    Then I scroll the stream results into view
    And I verify the stream summary contains 'Your smart stream includes all of your Sources at this time (showing only neutral sentiment).'
    And I verify the stream results contain the sentiment Neutral

  #@author Adam Kauffman
  #@source VH-15
  #@scenario Verify can preview post which has Negative sentiment
  @stream
  Scenario: Verify can preview post which has Neutral sentiment
    And I click on streams change filter
    And I click on advanced tab in the change filter panel
    And I click on Sentiment & Intent on the change filter panel
    Then I click on Negative in the change filter panel
    And I click on the streams preview button
    Then I click on the close button in the change filter panel
    And I verify the stream summary contains 'Your smart stream includes all of your Sources at this time (showing only negative sentiment).'
    And I verify the stream results contain the sentiment Negative

  #@author Adam Kauffman
  #@source VH-14
  #@scenario Verify can preview post which has Negative sentiment
  @stream
  Scenario: Verify can preview post which has Neutral sentiment
    And I click on streams change filter
    And I click on advanced tab in the change filter panel
    And I click on Sentiment & Intent on the change filter panel
    Then I click on Positive in the change filter panel
    And I click on the streams preview button
    And I verify the stream summary contains 'Your smart stream includes all of your Sources at this time (showing only positive sentiment).'
    And I verify the stream results contain the sentiment Positive

  #@author Adam Kauffman
  #@source VH-19
  #@scenario Verify can preview post related to timeline selected.
  @stream
  Scenario: Verify can preview post related to timeline selected.
    And I click on streams change filter
    And I click on advanced tab in the change filter panel
    And I click on Options on the change filter panel
    Then I click on Timelines on the change filter panel
    And I click on the streams preview button
    And I verify the stream summary contains 'Your smart stream includes your timelines for all of your Sources at this time.'


  #@author Adam Kauffman
  #@source VH-20
  #@scenario Verify can preview posts related to date filter selected
  @stream
  Scenario: Verify can preview posts related to date filter selected
    And I click on streams change filter
    And I click on advanced tab in the change filter panel
    And I click on Options on the change filter panel
    Then I click on the options gear of Date in the change filter panel
    And I click on 'Today' from the date options in the change filter panel
    Then I verify the preset date filter dates display 'Today'
    Then I click on the options gear of Date in the change filter panel
    And I click on 'Yesterday' from the date options in the change filter panel
    Then I verify the preset date filter dates display 'Yesterday'
    Then I click on the options gear of Date in the change filter panel
    And I click on 'Last 7 days' from the date options in the change filter panel
    Then I verify the preset date filter dates display 'Last 7 days'
    Then I click on the options gear of Date in the change filter panel
    And I click on 'Last 30 days' from the date options in the change filter panel
    Then I verify the preset date filter dates display 'Last 30 days'
    Then I activate the date filter in the change filter panel
    And I click on the streams preview button
    And I verify the stream summary contains date information
    And I verify the stream results are within the date range

  #@author Adam Kauffman
  #@source VH-21
  #@scenario Verify user able to add "Positive" sentiment to Facebook post
  @stream
  Scenario: Verify user able to add "Positive" sentiment to Facebook post
    And I click on streams change filter
    #start - necessary for consistent results, not part of test
    And I click on advanced tab in the change filter panel
    And I click on Sentiment & Intent on the change filter panel
    And I click on Neutral in the change filter panel
    And I click on Mentions tab in the change filter panel
    #end
    And I click on facebook mentions on the change filter panel
    And I click on the 'Analyze_page' account in mentions
    And I click on the streams preview button
    And I click on the close button in the change filter panel
    And I mark the first stream result as 'Positive'
    Then I verify the first stream result has a 'Positive' sentiment

  #@author Adam Kauffman
  #@source VH-23
  #@scenario Verify user able to add "Neutral" sentiment to Facebook post
  @stream
  Scenario: Verify user able to add "Neutral" sentiment to Facebook post
    And I click on streams change filter
    #start - necessary for consistent results, not part of test
    And I click on advanced tab in the change filter panel
    And I click on Sentiment & Intent on the change filter panel
    And I click on Positive in the change filter panel
    And I click on Mentions tab in the change filter panel
    #end
    And I click on facebook mentions on the change filter panel
    And I click on the 'Analyze_page' account in mentions
    And I click on the streams preview button
    And I click on the close button in the change filter panel
    And I mark the first stream result as 'Neutral'
    Then I verify the first stream result has a 'Neutral' sentiment

  #@author Adam Kauffman
  #@source VH-22
  #@scenario Verify user able to add "Negative" sentiment to Facebook post
  @stream
  Scenario: Verify user able to add "Negative" sentiment to Facebook post
    And I click on streams change filter
    #start - necessary for consistent results, not part of test
    And I click on advanced tab in the change filter panel
    And I click on Sentiment & Intent on the change filter panel
    And I click on Neutral in the change filter panel
    And I click on Mentions tab in the change filter panel
    #end
    And I click on facebook mentions on the change filter panel
    And I click on the 'Analyze_page' account in mentions
    And I click on the streams preview button
    And I click on the close button in the change filter panel
    And I mark the first stream result as 'Negative'
    Then I verify the first stream result has a 'Negative' sentiment


  #@author Lavanya Raviprakash
  @stream
  Scenario: Verify "Tracked" option in dropdown for stream filters
    When I click on streams change filter
    Then I click on dropdown for accounts
    And I select "Tracked" account filter dropdown option
    # This results should contain the accounts which are tracked or in case if no accounts present
    # then it has to show "No Entries found" message.
    Then I verify the tracking in the stream results

     #@author Lavanya Raviprakash
  @stream
  Scenario: Verify "Untracked" option in dropdown for stream filters
    When I click on streams change filter
    Then I click on dropdown for accounts
    And I select "Untracked" account filter dropdown option
    Then I verify the tracking in the stream results

     #@author Lavanya Raviprakash
@stream
  Scenario: Verify "Valid" option in dropdown for stream filters
    When I click on streams change filter
    Then I click on dropdown for accounts
    And I select "Valid" account filter dropdown option
    Then I verify the tracking in the stream results

    #@author Lavanya Raviprakash
@stream
  Scenario: Verify "Invalid" option in dropdown for stream filters
    When I click on streams change filter
    Then I click on dropdown for accounts
    And I select "Invalid" account filter dropdown option
    Then I verify the tracking in the stream results

    #@author Lavanya Raviprakash
@stream
  Scenario: Verify "All" option in dropdown for stream filters
    When I click on streams change filter
    Then I click on dropdown for accounts
    And I select "All" account filter dropdown option
    Then I verify the tracking in the stream results


#####################################################################################################################

  ## Tests for public Organization VH QA ORG1

#####################################################################################################################

   #@author Lavanya Raviprakash
@stream
  Scenario: Verify "Tracked" option in dropdown for stream filters on public Org
    Then I switch to 'VH QA Org 1' organization
    When I click on streams change filter
    Then I click on dropdown for accounts
    And I select "Tracked" account filter dropdown option
    # This results should contain the accounts which are tracked or in case if no accounts present
    # then it has to show "No Entries found" message.
    Then I verify the tracking in the stream results

     #@author Lavanya Raviprakash
@stream
  Scenario: Verify "Untracked" option in dropdown for stream filters on public Org
    Then I switch to 'VH QA Org 1' organization
    When I click on streams change filter
    Then I click on dropdown for accounts
    And I select "Untracked" account filter dropdown option
  Then I verify the tracking in the stream results

     #@author Lavanya Raviprakash
@stream
  Scenario: Verify "Valid" option in dropdown for stream filters on public Org
    Then I switch to 'VH QA Org 1' organization
    When I click on streams change filter
    Then I click on dropdown for accounts
    And I select "Valid" account filter dropdown option
  Then I verify the tracking in the stream results

    #@author Lavanya Raviprakash
@stream
  Scenario: Verify "Invalid" option in dropdown for stream filters on public Org
    Then I switch to 'VH QA Org 1' organization
    When I click on streams change filter
    Then I click on dropdown for accounts
    And I select "Invalid" account filter dropdown option
  Then I verify the tracking in the stream results

    #@author Lavanya Raviprakash
@stream
  Scenario: Verify "All" option in dropdown for stream filters on public Org
    Then I switch to 'VH QA Org 1' organization
    When I click on streams change filter
    Then I click on dropdown for accounts
    And I select "All" account filter dropdown option
  Then I verify the tracking in the stream results


