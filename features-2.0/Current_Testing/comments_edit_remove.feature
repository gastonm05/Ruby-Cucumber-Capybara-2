
######################################################################################################################
# Verify that an user should be able to edit/remove a comment in Explore or Stream when it was published with of the connected accounts.
######################################################################################################################

@selenium @newui @regression @regression_full @comment @new_regression
Feature: Edit/Remove comments in Explore or Stream

  Background:
    Given I am an existing user 'autoqa'
    Given I login using page object

  Scenario: An user should be able to remove a comment in Explore when it was published with an Instagram connected accounts
    When I navigate to explore
    And I enter "Automation" keyword to search
    And I select "Instagram" from dropdown
    Then I click on search
    And I select to comment the first post
    And I select "viralheattest" account
    And I comment the post with "comment to remove"
    And I wait for "360" seconds
    Then I click on search
    And I delete the comment "comment to remove"
    And I wait for "360" seconds
    Then I click on search
    And I verify there is no more comment containing "comment to remove"


###################################################################################################################

        # Verifying the edit and remove comments in Stream when it was published with of the connected accounts.

###################################################################################################################

  Scenario: An user should be able to remove a comment in Stream when it was published with an Instagram connected account
    When I navigate to stream
    And I click on streams change filter
    And I click on instagram
    And I select account 'viralheattest' from stream
    And I click on Preview button
    And I select to comment the first post of stream
    And I comment the stream post with 'comment to remove'
    And I wait for "360" seconds
    And I click on Preview button
    And I delete the comment 'comment to remove' from stream
    And I wait for "360" seconds
    And I click on Preview button
    And I verify there is no more comment containing "comment to remove" from stream

  Scenario: An user should be able to remove a comment in Stream when it was published with a Google+ connected account
    When I navigate to stream
    And I click on streams change filter
    And I click on Google Plus
    And I select account 'QAht4' from stream
    And I click on Preview button
    And I select to comment the first post of stream
    And I comment the stream post with 'comment to remove'
    And I wait for "360" seconds
    And I click on Preview button
    And I delete the comment 'comment to remove' from stream
    And I wait for "360" seconds
    And I click on Preview button
    And I verify there is no more comment containing "comment to remove" from stream

  Scenario: An user should be able to edit a comment in Stream when it was published with a Google+ connected account
    When I navigate to stream
    And I click on streams change filter
    And I click on Google Plus
    And I select account 'QAht4' from stream
    And I click on Preview button
    And I select to comment the first post of stream
    And I comment the stream post with 'comment to edit'
    And I wait for "360" seconds
    And I click on Preview button
    And I edit the comment 'comment to edit' from stream with the new content 'comment edited'