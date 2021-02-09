######################################################################################################################
# Approval chains system Improved
######################################################################################################################
#The approval chains system is closely tied in with the Authorizations granted to a Role.
#Only Members who have "Message requires approval" authorization can assign approval chains when composing messages.
#Only Members who have "Can approve messages" authorization can be a part (a reviewer) of an approval chain.
#Reviewers can only see the message when it is their turn to accept/reject the message

#NOTE: We will assume a Composer and 2 reviewers for the test cases
  #where chain1 is the approval chain and utest2 and quality are the managers for approval
  #viralheattest is the member requesting for approval
#IMP : Please do not remove the comments as it is the skeleton for approval chains scenarios
@selenium @newui @regression @regression_full @approval_chain
Feature: Approval Chains

  Background:
    Given I am an existing user 'viralheattest'
    Given I login using page object
    Then I switch to 'VH QA Org 1' organization
@current @publishing

  Scenario: Approval chains edit and deletes
  #Create an approval chain with 2 reviewers
    When I select settings
    And I select 'VH QA Org 1' Settings
  #Set users authorizations
    And I click on Authorizations
    And I select the 'Manager' for 'Can Approve Messages'
    And I select the 'Member' for 'Messages require approvals'
    And I click on 'update' button
  #Create the approval chain named chain1    
    When I select settings
    And I select 'VH QA Org 1' Settings
    And I click on Approval chains
    And I click on add approval chain link
    And I select 'utest2' as approver
    And I select 'Quality' as approver
    Then I name the chain as 'chain1'
    And I click on 'Save Approval Chain' button
  #In the list of approval chains, options to edit/delete is present for the newly created approval chain
    Then I edit 'chain1' by 'removing' 'Quality' as approver
    And I click on 'update approval chain' button
    And I edit 'chain1' by 'adding' 'Quality' as approver
    And I click on 'update approval chain' button
  #Deleting the approval chain can be performed after running all the scenarios

  @current @publishing
  Scenario: I can publish a message upon approval from two reviewers
  #Composer writes a message
    Then I click on Publish button
    And I select Publish a message
    And I add a message
    And I select 'group_account' accounts
    Then I finish accounts selection
    Then I add the approval chain 'chain1'
    Then I publish the message
    Then I verify the message in calendar
    And I logout using newui
  #Message goes to the first reviewer
    When I am an existing user 'utest2'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    And I approve the message new_method
    And I logout using newui
    #First reviewer accepts
  #Messages goes to the second reviewer
    When I am an existing user 'quality'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    And I approve the message new_method
  #Second reviewer accepts
  #Message is published/scheduled.
    And I verify the message in calendar
    And I logout using newui
    When I am an existing user 'viralheattest'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    Then I verify approved message in calendar

    #Message has to be verified in stream
    #And the message with link is shown on the platforms page

#Message Rejection at the beginning of the chain
@current @publishing1
  Scenario: First reviewer rejects the message
  #Composer writes a message
    Then I click on Publish button
    And I select Publish a message
    And I add a message
    And I select 'group_account' accounts
    Then I finish accounts selection
    Then I add the approval chain 'chain1'
    Then I publish the message
    Then I verify the message in calendar
    And I logout using newui
  #Message goes to the first reviewer
    When I am an existing user 'utest2'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
  #First reviewer rejects the message
    And I reject the message new_method
    And I logout using newui
  #Message goes back to the composer with option to edit/delete
    When I am an existing user 'viralheattest'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    Then I edit the message rejected new_method
    And I add a message
    Then I publish the message
    And I logout using newui
  #Message goes to the first reviewer
    When I am an existing user 'utest2'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    And I reject the message new_method
    And I logout using newui
  #Message goes back to the composer and it´s deleted
    When I am an existing user 'viralheattest'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    Then I delete the rejected message new_method

@current @publishing
  Scenario: Message Rejection at the middle/end of the chain
  #Composer writes a message
    Then I click on Publish button
    And I select Publish a message
    And I add a message
    And I select 'group_account' accounts
    Then I finish accounts selection
    Then I add the approval chain 'chain1'
    Then I publish the message
    Then I verify the message in calendar
    And I logout using newui
  #Message goes to the first reviewer
    When I am an existing user 'utest2'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
  #First reviewer approves the message
    And I approve the message new_method
    And I logout using newui
  #Second reviewer rejects
    When I am an existing user 'quality'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    And I reject the message new_method
    And I logout using newui
  #Message goes back to the composer with option to edit/delete
    When I am an existing user 'viralheattest'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    Then I edit the message rejected new_method
    And I add a message
    Then I publish the message
    And I logout using newui
  #Message goes to the first reviewer
    When I am an existing user 'utest2'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    And I reject the message new_method
    And I logout using newui
  #Message goes back to the composer with option to edit/delete
    When I am an existing user 'viralheattest'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    Then I delete the rejected message new_method

@current @publishing
  Scenario: Scheduled Message is edited after it passes the approval chain
  #Composer schedules a message and sends it for review
    Then I click on Publish button
    And I select Publish a message
    And I add a message
    And I select 'group_account' accounts
    Then I finish accounts selection
    Then I add the approval chain 'chain1'
    Then I schedule the message
    Then I verify the message in calendar
    And I logout using newui
  #Both reviewers accept the message
    When I am an existing user 'utest2'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    And I approve the message new_method
    And I logout using newui
    #First reviewer accepts
  #Messages goes to the second reviewer
    When I am an existing user 'quality'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    And I approve the message new_method
    And I logout using newui
  #Second reviewer accepts
  #the composer decides to edit the scheduled message
    When I am an existing user 'viralheattest'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    And I edit the message which is approved new_method
    And I add a message
    Then I publish the message
  #The message should be put back in review and go through the approval chain again
    Then I verify the message in calendar
    And I logout using newui
    When I am an existing user 'utest2'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    And I approve the message new_method
    And I logout using newui
  #First reviewer accepts
  #Messages goes to the second reviewer
    When I am an existing user 'quality'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    And I approve the message new_method
    And I logout using newui
  #Composer deletes the message
    When I am an existing user 'viralheattest'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    And I verify the scheduled and approved message ready for publishing

@current @publishing
  Scenario: Composer retains control of the message until the first reviewer takes action
#Composer writes a message
    Then I click on Publish button
    And I select Publish a message
    And I add a message
    And I select 'group_account' accounts
    Then I finish accounts selection
    Then I add the approval chain 'chain1'
    Then I publish the message
    Then I verify the message in calendar
    And I logout using newui
#Message goes to the first reviewer
    When I am an existing user 'utest2'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    Then I see the message for review in calendar new_method
    And I logout using newui
#Composer drills down into the message
    When I am an existing user 'viralheattest'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
#Composer has ability to edit/delete at this point as First reviewer has not acted on the message yet
    And I edit the message under review
    Then I delete the message under review

@current @publishing
  Scenario: Composer loses control of the message when the first reviewer accepts the message
  #Composer schedules a message and sends it for review
    Then I click on Publish button
    And I select Publish a message
    And I add a message
    And I select 'group_account' accounts
    Then I finish accounts selection
    Then I add the approval chain 'chain1'
    Then I schedule the message
    Then I verify the message in calendar
    And I logout using newui
  #Message goes to the  first reviewer
    When I am an existing user 'utest2'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    And I approve the message new_method
    And I logout using newui
  #First reviewer accepts.
  #Composer drills down into the message
    When I am an existing user 'viralheattest'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    Then I select the message under review
  #Composer cannot edit/delete message
    Then I do not view 'edit' button
    Then I do not view 'delete' button
  #Composer can see who the next reviewer is
    And I see 'Quality' as approver of the message

@current @publishing
  Scenario: Approval chain edit/delete once chain is in use
  #Create an approval chain
    When I select settings
    And I select 'VH QA Org 1' Settings
    And I click on Approval chains
    And I click on add approval chain link
    And I select 'utest2' as approver
    And I select 'Quality' as approver
    Then I name the chain with random name
    And I click on 'Save Approval Chain' button
  #As Composer, assign the approval chain to a message
    Then I click on Publish button
    And I select Publish a message
    And I add a message
    And I select 'group_account' accounts
    Then I finish accounts selection
    Then I add the approval chain created
    Then I publish the message
    Then I verify the message in calendar
  #Message is in require_review state at this point
  #Go to Approval Chain Settings
    When I select settings
    Then I select 'VH QA Org 1' Settings
    And I click on Approval chains
  #No delete option is present for the approval chain in use
    And I do not see delete button over the created approval chain in use
  #Unable to remove a User from the approval chain in use
    And I try to remove 'Quality' as approver from created approval chain
    And I logout using newui
  #Then I delete the approval chain 'chain2' after getting approval from two approvers
    When I am an existing user 'utest2'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    And I approve the message new_method
    And I logout using newui
  #First reviewer accepts
  #Messages goes to the second reviewer
    When I am an existing user 'quality'
    And I login using page object
    Then I switch to 'VH QA Org 1' organization
    Then I navigate to messages page
    And I approve the message new_method
    And I logout using newui
  #Now the approval chain can be deleted
    Given I am an existing user 'viralheattest'
    And I login using page object
  #Go to Approval Chain Settings
    Then I switch to 'VH QA Org 1' organization
    When I select settings
    Then I select 'VH QA Org 1' Settings
    And I click on Approval chains
    And I delete the approval chain created

#Consider the role of a reviewer.
@current @publishing
  Scenario: Role authorization update
  #Assumption, The reviewer is part of an approval chain which is currently in use
  #Composer schedules a message and sends it for review
    Then I click on Publish button
    And I select Publish a message
    And I add a message
    And I select 'group_account' accounts
    Then I finish accounts selection
    Then I add the approval chain 'chain1'
    Then I schedule the message
    Then I verify the message in calendar
  #Go to Org settings and open up the Authorization for the reviewer's role
    When I select settings
    And I select 'VH QA Org 1' Settings
    And I click on Authorizations
  #Remove Can Approve Messages auth and save
    And I deselect the 'Manager' for 'Can Approve Messages'
    And I click on 'update' button
  #The Can Approve Messages will be added back to the role since there is a user who is part of an approval chain which is in use
    And I select 'Can Approve Messages' permission
    And I see that 'Manager' is selected in the list

@current @publishing
  Scenario: Member (reviewer) removal from an org
  #Consider the role of a reviewer.
  #Assumption: The reviewer is part of an approval chain which is currently in use
  #Composer schedules a message and sends it for review
    Then I click on Publish button
    And I select Publish a message
    And I add a message
    And I select 'group_account' accounts
    Then I finish accounts selection
    Then I add the approval chain 'chain1'
    Then I schedule the message
    Then I verify the message in calendar
  #Go to Org settings and open up the Authorization for the reviewer's role
    When I select settings
    And I select 'VH QA Org 1' Settings
    And I click on Members
  #Option to remove the member should not be allowed
    And I try to delete 'utest2'
    And I see an error message after I click on 'Continue'
    Then I try to delete 'quality'
    And I see an error message after I click on 'Continue'

@current @publishing
  Scenario: Member (reviewer) role update
  #Consider the role of a reviewer.
  #Assumption: The reviewer is part of an approval chain which is currently in use
  #Composer schedules a message and sends it for review
    Then I click on Publish button
    And I select Publish a message
    And I add a message
    And I select 'group_account' accounts
    Then I finish accounts selection
    Then I add the approval chain 'chain1'
    Then I schedule the message
    Then I verify the message in calendar
  #Go to Org settings and open up the Authorization for the reviewer's role
    When I select settings
    And I select 'VH QA Org 1' Settings
    And I click on Members
  #Option to change the role of the reviewer should not be allowed
    And I try to edit the 'utest2' member role
    And I change the role to 'member'
    And I see an error message after I click on 'change'
    Then I try to edit the 'quality' member role
    And I change the role to 'member'
    And I see an error message after I click on 'change'


#  Scenario: Bulk uploading when messages require approval
#    When I select settings
#    And I select 'VH QA Org 1' Settings
#    And I click on Approval chains
#    And I select 'chain1' as default
#    Then I click on Publish button
#    And I select Bulk upload
#    And I select 'group_account' accounts
#    Then I finish accounts selection
#    And I upload a csv file 'bulk-uploading-sample.csv'
#    Then I click on schedule
#    Then I find the uploaded messages in the review section
#    When I am an existing user 'utest2'
#    And I login using page object
#    Then I switch to 'VH QA Org 1' organization
#    Then I navigate to messages page
#    And I approve the message
#    And I logout using newui
#   #First reviewer accepts
#
#   #Messages goes to the second reviewer
#    When I am an existing user 'quality'
#    And I login using page object
#    Then I switch to 'VH QA Org 1' organization
#    Then I navigate to messages page
#    And I approve the message
#    #Second reviewer accepts
#    #Message is published/scheduled.
#    And I verify the message in calendar
#    And I logout using newui
#    When I am an existing user 'viralheattest'
#    And I login using page object
#    Then I switch to 'VH QA Org 1' organization
#    Then I verify approved message in calendar
#    Then I select 'VH QA Org 1' Settings
#    And I click on Approval chains
#    And I deselect 'chain1' as default
