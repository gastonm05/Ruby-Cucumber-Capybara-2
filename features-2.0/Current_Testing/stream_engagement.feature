# verify the stream functionalities with respect to likes, comments, sentiment modifications, favourites, adding as tasks
# tagging
###################################################################################################################

        # Verifying the stream engagement functionalities for private account

###################################################################################################################
@selenium @newui @aaa @bbb @mentioning @regression @regression_full
  Feature: Verifying the stream functionalities

  Background:
    Given I am an existing user 'utest1'
    And I login using page object


  #cases for veriying the tag for tasks created with stream posts
  # VH - 460
  Scenario: Verify the task assigned tooltip for a post in stream
    When I select a post from stream
    Then I click on 'assign to...' from more dropdown
    Then I enter description 'task with tag4' to the task
    And I enter tags as 'verify4' and due date as '10/28/2016'
    And I click on assign task
    And I refresh the page
    And I see the task assigned status in user icon
    And I hover the mouse over user icon
    And I verify the assigner for the task in tooltip

  # VH-461
  Scenario: Verifying the icon for task created
    When I select a post from stream
    Then I click on 'assign to...' from more dropdown
    Then I enter description 'task with tag5' to the task
    And I enter tags as 'verify5' and due date as '10/28/2016'
    And I click on assign task
    And I refresh the page
    And I see the task assigned status in user icon
    And I hover the mouse over user icon
    And I verify the assigner for the task in tooltip
    Then I click on the user icon
    And I verify the page navigation to tasks page

  # VH-462
  Scenario: Verifying the tooltip for task created after removing the assigner
    When I select a post from stream
    Then I click on 'assign to...' from more dropdown
    Then I enter description 'task with tag6' to the task
    And I enter tags as 'verify6' and due date as '10/28/2016'
    And I see the assign to field set to 'Auto QA'
    And I click on assign task
    And I refresh the page
    And I see the task assigned status in user icon
    And I hover the mouse over user icon
    And I verify the assigner for the task in tooltip
    Then I click on the user icon
    And I verify the page navigation to tasks page
    Then I remove the user 'Auto QA' from assign to field
    Then I update the task
    And I refresh the page
    And I see the task assigned status in user icon
    And I hover the mouse over user icon
    And I see the text 'Assigned as task' in tooltip
    Then I navigate back to the stream
    Then I fetch the post for modified task
    And I see the task assigned status in user icon
    And I hover the mouse over user icon
    And I see the text 'Assigned as task' in tooltip

  # VH-471
  Scenario: Creating a task out of the icon above the post
    When I select a post from stream
    Then I click on the user icon
    Then I enter description 'task with tag7' to the task
    And I enter tags as 'verify7' and due date as '10/28/2016'
    And I click on assign task
    And I refresh the page
    And I see the task assigned status in user icon
    And I hover the mouse over user icon
    And I verify the assigner for the task in tooltip
    Then I click on the user icon
    And I verify the page navigation to tasks page




 #cases for veriying the tag for tasks created with stream post
 # VH - 473
  Scenario: Verify the task assigned tooltip for a post in stream
    Then I switch to 'VH QA Org 2' organization
    When I select a post from stream
    Then I click on 'assign to...' from more dropdown
    Then I enter description 'task with tag4' to the task
    And I enter tags as 'verify4' and due date as '10/28/2016'
    And I click on assign task
    And I refresh the page
    And I see the task assigned status in user icon
    And I hover the mouse over user icon
    And I verify the assigner for the task in tooltip

 # VH - 472
    Scenario: Verifying the icon for task created
    Then I switch to 'VH QA Org 2' organization
    When I select a post from stream
    Then I click on 'assign to...' from more dropdown
    Then I enter description 'task with tag5' to the task
    And I enter tags as 'verify5' and due date as '10/28/2016'
    And I click on assign task
    And I refresh the page
    And I see the task assigned status in user icon
    And I hover the mouse over user icon
    And I verify the assigner for the task in tooltip
    Then I click on the user icon
    And I verify the page navigation to tasks page

 # VH - 473
    Scenario: Verifying the tooltip for task created after removing the assigner
    Then I switch to 'VH QA Org 2' organization
    When I select a post from stream
    Then I click on 'assign to...' from more dropdown
    Then I enter description 'task with tag6' to the task
    And I enter tags as 'verify6' and due date as '10/28/2016'
    And I see the assign to field set to 'Auto QA'
    And I click on assign task
    And I refresh the page
    And I see the task assigned status in user icon
    And I hover the mouse over user icon
    And I verify the assigner for the task in tooltip
    Then I click on the user icon
    And I verify the page navigation to tasks page
    Then I remove the user 'Auto QA' from assign to field
    Then I update the task
    And I refresh the page
    And I see the task assigned status in user icon
    And I hover the mouse over user icon
    And I see the text 'Assigned as task' in tooltip
    Then I navigate back to the stream
    Then I fetch the post for modified task
    And I see the task assigned status in user icon
    And I hover the mouse over user icon
    And I see the text 'Assigned as task' in tooltip

 # VH - 463
    Scenario: Verify the task assigned tooltip for mutliple assigners
    Then I switch to 'VH QA Org 2' organization
    When I select a post from stream
    Then I click on 'assign to...' from more dropdown
    Then I enter description 'task with tag6' to the task
    And I enter tags as 'verify6' and due date as '10/28/2016'
    And I add the assign to field with user 'utest2'
    And I add the assign to field with user 'Auto QA'
    And I click on assign task
    And I refresh the page
    And I see the task assigned status in user icon
    And I hover the mouse over user icon
   #check should be made to verify only the first assigner will be displayed instead of two
    And I verify the assigner for the task in tooltip

 # VH - 475
  Scenario: Creating a task out of the icon above the post
    Then I switch to 'VH QA Org 2' organization
    When I select a post from stream
    Then I click on the user icon
    Then I enter description 'task with tag7' to the task
    And I enter tags as 'verify7' and due date as '10/28/2016'
    And I click on assign task
    And I refresh the page
    And I see the task assigned status in user icon
    And I hover the mouse over user icon
    And I verify the assigner for the task in tooltip
    Then I click on the user icon
    And I verify the page navigation to tasks page

