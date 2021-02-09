###################################################################################################################

        # Verifying the calendar functionalities for private account

###################################################################################################################
@selenium @newui
Feature: Verifying the calendar format and messages

  Background:
    Given I am an existing user 'autoqa'
    And I login using page object

  Scenario: Verify the format of calendar
    When I navigate to messages page
    When I see the days of the calendar
    And I see the day starting from 'sunday'
    Then I see the day ending at 'saturday'

  Scenario: Verify the day view of messages
    When I navigate to messages page
    Then I select 'Day' view
    And I see a published message
    And I hover the mouse over platform icon
    And I click on the message
    Then the message page opens successfully
    Then I verify the platforms published
    And I verify the exact message in the message window

  Scenario: Verify the first option in messages dropdown in day view
    When I navigate to messages page
    Then I select 'Day' view
    And I see a published message
    Then I click on the messages dropdown
    And I select the first option "View message details"
    Then I should see the message details page
    # Just check the message matches with link and image if present, with the message detail page
    And I verify the message in the details page
#VH-418
  Scenario: Verify the second option in messages dropdown in day view
    When I navigate to messages page
    Then I select 'Day' view
    And I see a published message
    Then I click on the messages dropdown
    And I select the first option "Republish message"
    Then I should be able to see the repost message modal
    And I will just click on repost in publishing modal
    Then I see the message reposted in calendar

  Scenario: Verify the third option in messages dropdown in day view
    When I navigate to messages page
    Then I select 'Day' view
    And I see a published message
    Then I click on the messages dropdown
    And I select the first option "Edit Tags and Memo"
    Then I should be able to see the page for editing tags and memo
    And I enter "Verify tags and memo" in memo
    And I enter "Verify TM in autoqa"
    Then I see the tags and memo update successfully in calendar

  Scenario: Verify the fourth option in messages dropdown in day view
    When I navigate to messages page
    Then I select 'Day' view
    And I see a published message
    Then I click on the messages dropdown
    And I select the first option "View rejections reasons"
    Then I should be able to see Rejection reasons page
    Then I close the page

  Scenario: Verifying the published message status
    When I navigate to messages page
    Then I select 'Day' view
    And I see a published message
    Then I click on the top left corner of the message
    And I should see message status window
    Then I close the Message status window

  Scenario: Verify the week view of messages
    When I navigate to messages page
    Then I select 'week' view
    And I see a published message
    And I hover the mouse over platform icon
    Then I verify the platforms published to
    And I click on the message
    Then the message page opens successfully
    And I verify the exact message in the message window

  Scenario: Verify the first option in messages dropdown in week view
    When I navigate to messages page
    Then I select 'week' view
    And I see a published message
    Then I click on the messages dropdown
    And I select the first option "View message details"
    Then I should see the message details page
    # Just check the message matches with link and image if present, with the message detail page
    And I verify the message in the details page
#VH-418
  Scenario: Verify the second option in messages dropdown in week view
    When I navigate to messages page
    Then I select 'week' view
    And I see a published message
    Then I click on the messages dropdown
    And I select the first option "Republish message"
    Then I should be able to see the repost message modal
    And I will just click on repost in publishing modal
    Then I see the message reposted in calendar

  Scenario: Verify the fourth option in messages dropdown in week view
    When I navigate to messages page
    Then I select 'week' view
    And I see a published message
    Then I click on the messages dropdown
    And I select the first option "View rejections reasons"
    Then I should be able to see Rejection reasons page
    Then I close the page

  Scenario: Verifying the published message status
    When I navigate to messages page
    Then I select 'week' view
    And I see a published message
    Then I click on the top left corner of the message
    And I should see message status window
    Then I close the Message status window

  Scenario: Verifying the post for central time
    When I navigate to messages page
    Then I select 'week' view
    And I select a published message
    And I change the timezone to central time
    And I verify the messages accurately in central time

  Scenario: Verifying the post for pacific time
    When I navigate to messages page
    Then I select week view
    And I select a published message
    And I change the timezone to pacific time
    And I verify the messages accurately in pacific time

  Scenario: Verifying the post for mountain time
    When I navigate to messages page
    Then I select 'week' view
    And I select a published message
    And I change the timezone to mountain time
    And I verify the messages accurately in mountain time

  Scenario: Verifying the post for eastern time
    When I navigate to messages page
    Then I select 'week' view
    And I select a published message
    And I change the timezone to eastern time
    And I verify the messages accurately in eastern time

  Scenario: Verify the month view of messages
    When I navigate to messages page
    Then I select 'month' view
    And I see a published message
    And I click on more
    And I see the message will expand
    And I click on less
    And I see the message gets shortened
    Then I verify the platforms published to
    And I click on the message
    Then the message page opens successfully
    And I verify the exact message in the message window

  Scenario: Verify the first option in messages dropdown in month view
    When I navigate to messages page
    Then I select 'month' view
    And I see a published message
    Then I click on the messages dropdown
    And I select the first option "View message details"
    Then I should see the message details page
    # Just check the message matches with link and image if present, with the message detail page
    And I verify the message in the details page
#VH-418
  Scenario: Verify the second option in messages dropdown in week view
    When I navigate to messages page
    Then I select 'month' view
    And I see a published message
    Then I click on the messages dropdown
    And I select the first option "Republish message"
    Then I should be able to see the repost message modal
    And I will just click on repost in publishing modal
    Then I see the message reposted in calendar

  Scenario: Verify the fourth option in messages dropdown in week view
    When I navigate to messages page
    Then I select 'month' view
    And I see a published message
    Then I click on the messages dropdown
    And I select the first option "View rejections reasons"
    Then I should be able to see Rejection reasons page
    Then I close the page

  Scenario: Verifying the published message status
    When I navigate to messages page
    Then I select 'month' view
    And I see a published message
    Then I click on the top left corner of the message
    # message will have pending,error, successful, review state
    And I should see message status window
    Then I close the Message status window
#VH-789
  Scenario: Verifying the Archives tab
    When I navigate to messages page
    Then I select 'archives' view
    And I see the available download links

#VH-789
  Scenario: Verifying the Archives tab
    When I navigate to messages page
    Then I select 'archives' view
    And I see the archives view
    Then I select 'today' date
    And I see archive for 'today'

#VH-789
  Scenario: Verifying the Archives tab
    When I navigate to messages page
    Then I select 'archives' view
    And I see the archives view
    Then I select 'next year' date
    And I see no archives available

#VH-789
  Scenario: Test Time Zone changes
    When I navigate to messages page
    And I change the timezone to 'central time'
    Then I verify the messages accurately in 'central time'
#VH-789
  Scenario: Test Time Zone changes
    When I navigate to messages page
    And I change the timezone to 'pacific time'
    Then I verify the messages accurately in 'pacific time'
#VH-789
  Scenario: Test Time Zone changes
    When I navigate to messages page
    And I change the timezone to 'mountain time'
    Then I verify the messages accurately in 'mountain time'
#VH-789
  Scenario: Test Time Zone changes
    When I navigate to messages page
    And I change the timezone to 'eastern time'
    Then I verify the messages accurately in 'eastern time'
    

  Scenario: Publishing a message with image and link
    When I navigate to messages page
    Then I click on Publish button
    And I select Publish a message
    When I select 'group_account' accounts
    Then I finish accounts selection
    Then I select to Upload images
    And I select 'book1.jpg' images by uploading
    And I select 'car.jpg' images by uploading
    And I enter the album name as 'FB Album1'
    Then I finish image attach
    And I should be able to see the image attached
    Then I add a message with a link 'https://utest-dl.s3.amazonaws.com/4777/3560/27369/null/bugAttachment/Bug677597_UpdateRoleWithBlankName.swf?AWSAccessKeyId=AKIAJVVOIXUIFRTEEEKQ&Expires=1466787356&Signature=yXbUnUA4islFnuzCvk4vq64OldQ%3D'
    And I publish the message
    And I navigate to messages page
    Then I select 'day' view
    Then I see the images and link in message snippet
    Then I select 'week' view
    Then I see the images and link in message snippet

  Scenario: Publishing a message directly from calendar with day view
    When I navigate to messages page
    When I select 'day' view
    And I hover on the time after 'now'
    And I double click on any blank space
    Then I select 'group_account' accounts
    And I add a message
    And I publish the message
    And I see the message in message snippet in 'day' view

  Scenario: Publishing a message directly from calendar with week view
    When I navigate to messages page
    When I select 'week' view
    And I hover on the time after 'now'
    And I double click on any blank space
    Then I select 'group_account' accounts
    And I add a message
    And I publish the message
    And I see the message in message snippet in 'week' view

  Scenario: Publishing a message directly from calendar with week view
    When I navigate to messages page
    When I select 'month' view
    And I hover on the time after 'now'
    And I double click on any blank space
    Then I select 'group_account' accounts
    And I add a message
    And I publish the message
    And I see the message in message snippet in 'month' view

####################################################################################################################

    ## Tests for public Organization VH QA ORG1

###################################################################################################################

  Scenario: Verify the format of calendar
    Then I switch to 'VH QA Org 1' organization
    When I navigate to messages page
    When I see the days of the calendar
    And I see the day starting from 'sunday'
    Then I see the day ending at 'saturday'

  Scenario: Verify the day view of messages
    Then I switch to 'VH QA Org 1' organization
    When I navigate to messages page
    Then I select 'Day' view
    And I see a published message
    And I hover the mouse over platform icon
    Then I verify the platforms published to
    And I click on the message
    Then the message page opens successfully
    And I verify the exact message in the message window

  Scenario: Verify the first option in messages dropdown in day view
    Then I switch to 'VH QA Org 1' organization
    When I navigate to messages page
    Then I select 'Day' view
    And I see a published message
    Then I click on the messages dropdown
    And I select the first option "View message details"
    Then I should see the message details page
    # Just check the message matches with link and image if present, with the message detail page
    And I verify the message in the details page
#VH-418
  Scenario: Verify the second option in messages dropdown in day view
    Then I switch to 'VH QA Org 1' organization
    When I navigate to messages page
    Then I select 'Day' view
    And I see a published message
    Then I click on the messages dropdown
    And I select the first option "Republish message"
    Then I should be able to see the repost message modal
    And I will just click on repost in publishing modal
    Then I see the message reposted in calendar

  Scenario: Verify the third option in messages dropdown in day view
    Then I switch to 'VH QA Org 1' organization
    When I navigate to messages page
    Then I select 'Day' view
    And I see a published message
    Then I click on the messages dropdown
    And I select the first option "Edit Tags and Memo"
    Then I should be able to see the page for editing tags and memo
    And I enter "Verify tags and memo" in memo
    And I enter "Verify TM in autoqa"
    Then I see the tags and memo update successfully in calendar

  Scenario: Verify the fourth option in messages dropdown in day view
    Then I switch to 'VH QA Org 1' organization
    When I navigate to messages page
    Then I select 'Day' view
    And I see a published message
    Then I click on the messages dropdown
    And I select the first option "View rejections reasons"
    Then I should be able to see Rejection reasons page
    Then I close the page

  Scenario: Verifying the published message status
    Then I switch to 'VH QA Org 1' organization
    When I navigate to messages page
    Then I select 'Day' view
    And I see a published message
    Then I click on the top left corner of the message
    And I should see message status window
    Then I close the Message status window

  Scenario: Verify the week view of messages
    Then I switch to 'VH QA Org 1' organization
    When I navigate to messages page
    Then I select 'week' view
    And I see a published message
    And I hover the mouse over platform icon
    Then I verify the platforms published to
    And I click on the message
    Then the message page opens successfully
    And I verify the exact message in the message window

  Scenario: Verify the first option in messages dropdown in week view
    Then I switch to 'VH QA Org 1' organization
    When I navigate to messages page
    Then I select 'week' view
    And I see a published message
    Then I click on the messages dropdown
    And I select the first option "View message details"
    Then I should see the message details page
    # Just check the message matches with link and image if present, with the message detail page
    And I verify the message in the details page
#VH-418
  Scenario: Verify the second option in messages dropdown in week view
    Then I switch to 'VH QA Org 1' organization
    When I navigate to messages page
    Then I select 'week' view
    And I see a published message
    Then I click on the messages dropdown
    And I select the first option "Republish message"
    Then I should be able to see the repost message modal
    And I will just click on repost in publishing modal
    Then I see the message reposted in calendar

  Scenario: Verify the fourth option in messages dropdown in week view
    Then I switch to 'VH QA Org 1' organization
    When I navigate to messages page
    Then I select 'week' view
    And I see a published message
    Then I click on the messages dropdown
    And I select the first option "View rejections reasons"
    Then I should be able to see Rejection reasons page
    Then I close the page

  Scenario: Verifying the published message status
    Then I switch to 'VH QA Org 1' organization
    When I navigate to messages page
    Then I select 'week' view
    And I see a published message
    Then I click on the top left corner of the message
    And I should see message status window
    Then I close the Message status window

  Scenario: Verifying the post for central time
    Then I switch to 'VH QA Org 1' organization
    When I navigate to messages page
    Then I select 'week' view
    And I select a published message
    And I change the timezone to central time
    And I verify the messages accurately in central time

  Scenario: Verifying the post for pacific time
    Then I switch to 'VH QA Org 1' organization
    When I navigate to messages page
    Then I select week view
    And I select a published message
    And I change the timezone to pacific time
    And I verify the messages accurately in pacific time


  Scenario: Verifying the post for mountain time
    Then I switch to 'VH QA Org 1' organization
    When I navigate to messages page
    Then I select 'week' view
    And I select a published message
    And I change the timezone to mountain time
    And I verify the messages accurately in mountain time

  Scenario: Verifying the post for eastern time
    Then I switch to 'VH QA Org 1' organization
    When I navigate to messages page
    Then I select 'week' view
    And I select a published message
    And I change the timezone to eastern time
    And I verify the messages accurately in eastern time

  Scenario: Verify the month view of messages
    Then I switch to 'VH QA Org 1' organization
    When I navigate to messages page
    Then I select 'month' view
    And I see a published message
    And I click on more
    And I see the message will expand
    And I click on less
    And I see the message gets shortened
    Then I verify the platforms published to
    And I click on the message
    Then the message page opens successfully
    And I verify the exact message in the message window

  Scenario: Verify the first option in messages dropdown in month view
    Then I switch to 'VH QA Org 1' organization
    When I navigate to messages page
    Then I select 'month' view
    And I see a published message
    Then I click on the messages dropdown
    And I select the first option "View message details"
    Then I should see the message details page
    # Just check the message matches with link and image if present, with the message detail page
    And I verify the message in the details page
#VH-418
  Scenario: Verify the second option in messages dropdown in week view
    Then I switch to 'VH QA Org 1' organization
    When I navigate to messages page
    Then I select 'month' view
    And I see a published message
    Then I click on the messages dropdown
    And I select the first option "Republish message"
    Then I should be able to see the repost message modal
    And I will just click on repost in publishing modal
    Then I see the message reposted in calendar

  Scenario: Verify the fourth option in messages dropdown in week view
    Then I switch to 'VH QA Org 1' organization
    When I navigate to messages page
    Then I select 'month' view
    And I see a published message
    Then I click on the messages dropdown
    And I select the first option "View rejections reasons"
    Then I should be able to see Rejection reasons page
    Then I close the page

  Scenario: Verifying the published message status
    Then I switch to 'VH QA Org 1' organization
    When I navigate to messages page
    Then I select 'month' view
    And I see a published message
    Then I click on the top left corner of the message
    # message will have pending,error, successful, review state
    And I should see message status window
    Then I close the Message status window

  Scenario: Publishing a message with image and link
    Then I switch to 'VH QA Org 1' organization
    When I navigate to messages page
    Then I click on Publish button
    And I select Publish a message
    When I select 'group_account' accounts
    Then I finish accounts selection
    Then I select to Upload images
    And I select 'Image_set1' images by uploading
    And I select 'Image_set2' images by uploading
    And I enter the album name as 'FB Album1'
    Then I finish image attach
    And I should be able to see the image attached
    Then I add a message with a link 'https://utest-dl.s3.amazonaws.com/4777/3560/27369/null/bugAttachment/Bug677597_UpdateRoleWithBlankName.swf?AWSAccessKeyId=AKIAJVVOIXUIFRTEEEKQ&Expires=1466787356&Signature=yXbUnUA4islFnuzCvk4vq64OldQ%3D'
    And I publish the message
    And I navigate to messages
    Then I select 'day' view
    Then I see the images and link in message snippet
    Then I select 'week' view
    Then I see the images and link in message snippet

  Scenario: Publishing a message directly from calendar with day view
    Then I switch to 'VH QA Org 1' organization
    When I navigate to messages page
    When I select 'day' view
    And I hover on the time after 'now'
    And I double click on any blank space
    Then I select 'group_account' accounts
    And I add a message
    And I publish the message
    And I see the message in message snippet in 'day' view

  Scenario: Publishing a message directly from calendar with week view
    Then I switch to 'VH QA Org 1' organization
    When I navigate to messages page
    When I select 'week' view
    And I hover on the time after 'now'
    And I double click on any blank space
    Then I select 'group_account' accounts
    And I add a message
    And I publish the message
    And I see the message in message snippet in 'week' view

  Scenario: Publishing a message directly from calendar with week view
    Then I switch to 'VH QA Org 1' organization
    When I navigate to messages page
    When I select 'month' view
    And I hover on the time after 'now'
    And I double click on any blank space
    Then I select 'group_account' accounts
    And I add a message
    And I publish the message
    And I see the message in message snippet in 'month' view