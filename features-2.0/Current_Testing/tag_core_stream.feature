# verify the stream functionalities with respect to likes, comments, sentiment modifications, favourites, adding as tasks
# tagging
###################################################################################################################

        # Verifying tag functionality on the stream for private account

###################################################################################################################
@selenium @newui @core_tag @regression @regression_full
Feature: Verifying the tag add and edit stream functionalities

  Background:
    Given I am an existing user 'autoqa'
    And I login using quick page object

  Scenario: Tagging a post in stream

    Then I navigate to stream page
    Then I click on edit for tags on the first post
    And I add a tag as 'tag_example'
    And I change the tag successfully
    Then I verify the tag 'tag_example' on the last post
@tag_test1
  Scenario: Verifying delete tag functionality
    Then I navigate to stream page
    Then I click on edit for tags on the first post
    And I add a tag as 'tag_example_4'
    And I change the tag successfully
    Then I click on edit for tags on the first post
    And I delete all the tags from the selected post
    And I verify the tag 'tag_example_4' is not present on the posts

  Scenario: Verifying the tag for relevant posts
    Then I navigate to stream page
    Then I click on edit for tags on the first post
    And I add a tag as 'tag_example_2'
    And I change the tag successfully
    Then I click on first post with tag 'tag_example_2'
    And I see that the new window opens
    And I verify the stream results contain only relevant posts with specified tag 'tag_example_2'

  Scenario: Validating the tag name with special characters
    Then I navigate to stream page
    Then I click on edit for tags on the first post
    And I add a tag as '& auto $ verify, tags'
    And I change the tag successfully
    Then I verify the tag '& auto $ verify, tags' on the last post

  Scenario: Verifying the functionality of multiple tags
    Then I navigate to stream page
    Then I click on edit for tags on the first post
    And I add 'tag_set1' tags
    And I change the tag successfully
    Then I verify multiple tags on stream post

  Scenario: Validating the tag with long text and multiple tags
    Then I navigate to stream page
    Then I click on edit for tags on the first post
    And I add 'tag_set2' tags
    And I change the tag successfully
    Then I verify multiple tags on stream post

  Scenario: Verify the tag search
    Then I navigate to stream page
    Then I click on edit for tags on the first post
    And I add a tag as 'tag_example_3'
    And I change the tag successfully
    When I click on streams change filter
    Then I click on advanced tab in the change filter panel
    And I click on Options on the change filter panel
    Then I select 'tag_example_3' tags
    Then I click on the streams preview button
    And I verify the stream summary contains 'Your smart stream includes the mentions for all of your Sources at this time that have been tagged using "tag_example_3".'
    And I verify the stream results contain only relevant posts with specified tag 'tag_example_3'

  Scenario: Verify the tag search
    Then I navigate to stream page
    Then I click on edit for tags on the first post
    And I add 'tag_set3' tags
    And I change the tag successfully
    When I click on streams change filter
    Then I click on advanced tab in the change filter panel
    And I click on Options on the change filter panel
    And I add 'tag_set3' tags
    Then I click on the streams preview button
    And I verify the stream summary contains 'tag_set3' tag set
    Then I click on edit for tags on the first post
    And I delete all the tags from the selected post
    Then I wait for "30" seconds
