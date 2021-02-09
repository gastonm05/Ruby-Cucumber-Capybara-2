# verify the stream functionalities with respect to likes, comments, sentiment modifications, favourites, adding as tasks
# tagging
###################################################################################################################

        # Verifying tag functionality on the stream for public Organization VH QA ORG2


###################################################################################################################
@selenium @newui @extended_tag @regression_full
Feature: Verifying the tag add and edit stream functionalities

  Background:
    Given I am an existing user 'utest1'
    And I login using quick page object



  Scenario: Tagging a post in stream
    Then I switch to 'VH QA Org 2' organization
    When I select a post from stream
    #Then I change the tags from more dropdown
    Then I click on edit for tags on the first post
    And I add a tag as 'auto verify Pub'
    And I change the tag successfully
    Then I verify the tag 'auto verify Pub' on the last post

  Scenario: Verifying the tag for relevant posts
    Then I switch to 'VH QA Org 2' organization
    When I select a post with tag 'auto verify Pub' from stream
    Then I click on first post with tag 'auto verify Pub'
    And I see that the new window opens
    # The posts fetched should be relevant only to the tags
    And I see posts only with tag 'auto verify Pub'

  Scenario: Validating the tag name with special characters
    Then I switch to 'VH QA Org 2' organization
    When I select a post from stream
    #Then I change the tags from more dropdown
    Then I click on edit for tags on the first post
    And I add a tag as '& auto $ verify, pub'
    And I change the tag successfully
    Then I verify the tag '& auto $ verify, pub' on the last post

  Scenario: Verifying the functionality of multiple tags
    Then I switch to 'VH QA Org 2' organization
    When I select a post from stream
    #Then I change the tags from more dropdown
    Then I click on edit for tags on the first post
    And I add 'tag_setp1' tags
    And I change the tags successfully
    # I should see all the tags mentioned while creating
    Then I verify multiple tags on stream post

  Scenario: Validating the tag with long text and multiple tags
    Then I switch to 'VH QA Org 2' organization
    When I select a post from stream
    #Then I change the tags from more dropdown
    Then I click on edit for tags on the first post
    And I add 'tag_setp2' tags
    And I change the tag successfully
    # I should see all the tags mentioned while creating and also the tag names should not be overflowing outside the page in streams
    Then I verify multiple tags on stream post


  Scenario: Verifying delete tag functionality
    Then I switch to 'VH QA Org 2' organization
    When I select a post with tag from stream
    Then I click on edit for tags on the selected post
    And I delete all the tags from the selected post
    And I see the tags are deleted from the selected post

  Scenario: Verify the tag search
    Then I switch to 'VH QA Org 2' organization
    When I click on streams change filter
    Then I click on advanced tab in the change filter panel
    And I click on Options on the change filter panel
    Then I select 'verify' tags
    #And I enable the tag field
    Then I click on the streams preview button
    And I verify the stream summary contains 'Your smart stream includes all of your Sources at this time that have been tagged using "verify".'
    And I verify the stream results contain only relevant posts with specified tag 'verify'

  Scenario: Verify the tag search
    Then I switch to 'VH QA Org 2' organization
    When I click on streams change filter
    Then I click on advanced tab in the change filter panel
    And I click on Options on the change filter panel
    Then I select 'Tag_setp3' tags
    And I enable the tag field
    Then I click on the streams preview button
    # As I havent specified the tags for message but I have just included 'tag_setp3'
    And I verify the stream summary contains 'Your smart stream includes all of your Sources at this time that have been tagged using (showing only 'Tag_setp3').'
    And I verify the stream results contain only relevant posts with specified tag 'Tag_setp3'
  @tag1 @selenium @newui
  Scenario: Verifying the tags in tasks
    Then I switch to 'VH QA Org 2' organization
    When I select a post with tag from stream
    Then I click on 'assign to...' from more dropdown
    Then I enter description 'task with tag for public 1' to the task
    And I enter tags as 'verifyp1' and due date as '10/20/2016'
    And I click on assign task
    Then I navigate to tasks page
    And I open the task 'task with tag for public 1'
    And I see that the tag is present
    Then I should be able to click on the tag inside the post on the task
    And I verify the relevant results fetched in new window

  Scenario: Verifying the tags in tasks with delete functionality
    Then I switch to 'VH QA Org 2' organization
    When I select a post with tag from stream
    Then I click on 'assign to...' from more dropdown
    Then I enter description 'task with tag for public 2' to the task
    And I enter tags as 'verifyp2' and due date as '10/22/2016'
    And I click on assign task
    Then I navigate to tasks page
    And I open the task 'task with tag for public 2'
    And I see that the tag is present
    #Then I change the tags from more dropdown on task page
    Then I click on edit for tags on task page
    And I delete the tag
    And I refresh the page
    Then I see the tag deleted from post
    # verifying the integartion between tasks and stream
    Then I navigate to stream to verify the tag deleted from the post

  Scenario: Verifying the tags in tasks by replacing another
    Then I switch to 'VH QA Org 2' organization
    When I select a post with tag from stream
    Then I click on 'assign to...' from more dropdown
    Then I enter description 'task with tag for public 3' to the task
    And I enter tags as 'verifyp3' and due date as '10/24/2016'
    And I click on assign task
    Then I navigate to tasks page
    And I open the task 'task with tag for public 3'
    And I see that the tag is present
    #Then I change the tags from more dropdown on task page
    Then I click on edit for tags on task page
    And I delete the tag
    And I add 'replace1' tags
    And I refresh the page
    Then I see the tag replaced from post




