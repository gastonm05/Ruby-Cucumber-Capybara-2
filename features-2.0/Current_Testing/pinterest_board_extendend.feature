 ######################################################################################################################

         # Verifying Publishing on Pinterest new board extended functionalities

 ######################################################################################################################

@selenium @newui   @pinterest_board_extended @regression_full
Feature: Publishing images to Pinterest board

  Background:
   Given I am an existing user 'autoqa'
   Given I login using quick page object

  Scenario: Publishing image to a group account including pinterest
    Then I click on Publish button
    And I select Publish a message
    When I select 'autoqa0079' accounts
    And I select 'group_account' accounts
    Then I finish accounts selection
    Then I add a message
    Then I select to Upload image
    And I choose to attach an image by URL "http://www.enchantedlearning.com/dgifs/Dolphin_color.GIF"
    Then I click on attach file
    Then I finish image attach
    Then I enter '.*' as board name for pinterest
    And I enter '.*' as board description for pinterest
    And I publish the message
    Then I verify the publish was succesfully
    Then I verify the published message on messages to exact board name
    And I verify the published message on platform
    And I delete the board

  Scenario: Multi Image uploading including pinterest
    Then I click on Publish button
    And I select Publish a message
    When I select 'group_account' accounts
    And I select 'autoqa0079' accounts
    Then I finish accounts selection
    Then I select to Upload image
    And I select an image set of 6 images for uploading
    And I insert 'fb album' as album name for facebook
    Then I finish image attach
    And I should be able to see '6' images attached
    Then I enter '.*' as board name for pinterest
    And I enter '.*' as board description for pinterest
    And I see the limit set for twitter images upload
    And I verify that just the first image will be publish on pinterest
    And I publish the message
    Then I verify the publish was succesfully
    Then I verify the published message on messages to exact board name
    And I verify the published message on platform
    And I delete the board

  Scenario: Publishing a message from messages page
    When I navigate to messages page
    Then I select 'week' view
    And I double click on date and time for current day
    And I see the publishing modal
    And I select 'autoqa0079' accounts
    Then I finish accounts selection
    Then I add a message
    Then I select to Upload image
    And I select 'image3' for uploading
    Then I finish image attach
    Then I enter '.*' as board name for pinterest
    And I enter '.*' as board description for pinterest
    And I publish the message
    Then I verify the publish was succesfully
    Then I verify the published message on messages to exact board name
    And I delete the board



  Scenario: Publishing to a group accounts including pinterest for existing board
    Then I click on Publish button
    And I select Publish a message
    When I select 'group_account' accounts
    And I select 'autoqa0079' accounts
    Then I finish accounts selection
    Then I select to Upload image
    And I select an image set of 6 images for uploading
    And I insert 'fb album' as album name for facebook
    Then I finish image attach
    And I should be able to see '6' images attached
    Then I select the existing board name for pinterest
    And I do not see board description
    And I verify the message for board name publishing in summary
    And I see the limit set for twitter images upload
    And I verify that just the first image will be publish on pinterest
    And I publish the message
    Then I verify the publish was succesfully
    Then I verify the published message on messages to exact board name
    And I verify the published message on platform

    ########################################################################################################
    # Scenarios for public organizations
    ########################################################################################################

  Scenario: Publishing a .jpg image to pinterest new board
    When I switch to 'Auto QA Beta' organization
    Then I click on Publish button
    And I select Publish a message
    When I select 'autoqa0079' accounts
    Then I finish accounts selection
    Then I add a message
    Then I select to Upload image
    And I select 'image1' for uploading
    Then I finish image attach
    Then I enter '.*' as board name for pinterest
    And I enter '.*' as board description for pinterest
    And I publish the message
    Then I verify the publish was succesfully
    Then I verify the published message on messages to exact board name
    And I verify the published message on platform
    And I delete the board

  Scenario: Publishing a .gif image to pinterest
    When I switch to 'Auto QA Beta' organization
    Then I click on Publish button
    And I select Publish a message
    When I select 'autoqa0079' accounts
    Then I finish accounts selection
    Then I add a message
    Then I select to Upload image
    And I select 'image2' for uploading
    Then I finish image attach
    Then I enter '.*' as board name for pinterest
    And I enter '.*' as board description for pinterest
    And I publish the message
    Then I verify the publish was succesfully
    Then I verify the published message on messages to exact board name
    And I verify the published message on platform
    And I delete the board

  Scenario: Publishing a .png image to pinterest
    When I switch to 'Auto QA Beta' organization
    Then I click on Publish button
    And I select Publish a message
    When I select 'autoqa0079' accounts
    Then I finish accounts selection
    Then I add a message
    Then I select to Upload image
    And I select 'image3' for uploading
    Then I finish image attach
    Then I enter '.*' as board name for pinterest
    And I enter '.*' as board description for pinterest
    And I publish the message
    Then I verify the publish was succesfully
    Then I verify the published message on messages to exact board name
    And I verify the published message on platform
    And I delete the board

  Scenario: Publishing an image using URL to pinterest
    When I switch to 'Auto QA Beta' organization
    Then I click on Publish button
    And I select Publish a message
    When I select 'autoqa0079' accounts
    Then I finish accounts selection
    Then I add a message
    Then I select to Upload image
    And I choose to attach an image by URL "http://www.enchantedlearning.com/dgifs/Dolphin_color.GIF"
    Then I click on attach file
    Then I finish image attach
    Then I enter '.*' as board name for pinterest
    And I enter '.*' as board description for pinterest
    And I publish the message
    Then I verify the publish was succesfully
    Then I verify the published message on messages to exact board name
    And I verify the published message on platform
    And I delete the board

  Scenario: Publishing image to a group account including pinterest
    When I switch to 'Auto QA Beta' organization
    Then I click on Publish button
    And I select Publish a message
    When I select 'autoqa0079' accounts
    And I select 'group_account' accounts
    Then I finish accounts selection
    Then I add a message
    Then I select to Upload image
    And I choose to attach an image by URL "http://www.enchantedlearning.com/dgifs/Dolphin_color.GIF"
    Then I click on attach file
    Then I finish image attach
    Then I enter '.*' as board name for pinterest
    And I enter '.*' as board description for pinterest
    And I publish the message
    Then I verify the publish was succesfully
    Then I verify the published message on messages to exact board name
    And I verify the published message on platform
    And I delete the board

  Scenario: Multi Image uploading including pinterest
    When I switch to 'Auto QA Beta' organization
    Then I click on Publish button
    And I select Publish a message
    When I select 'group_account' accounts
    And I select 'autoqa0079' accounts
    Then I finish accounts selection
    Then I select to Upload image
    And I select an image set of 6 images for uploading
    And I insert 'fb album' as album name for facebook
    Then I finish image attach
    And I should be able to see '6' images attached
    Then I enter '.*' as board name for pinterest
    And I enter '.*' as board description for pinterest
    And I see the limit set for twitter images upload
    And I verify that just the first image will be publish on pinterest
    And I publish the message
    Then I verify the publish was succesfully
    Then I verify the published message on messages to exact board name
    And I verify the published message on platform
    And I delete the board

  Scenario: Publishing a message from messages page
    When I switch to 'Auto QA Beta' organization
    When I navigate to messages page
    Then I select 'week' view
    And I double click on date and time for current day
    And I see the publishing modal
    And I select 'autoqa0079' accounts
    Then I finish accounts selection
    Then I add a message
    Then I select to Upload image
    And I select 'image3' for uploading
    Then I finish image attach
    Then I enter '.*' as board name for pinterest
    And I enter '.*' as board description for pinterest
    And I publish the message
    Then I verify the publish was succesfully
    Then I verify the published message on messages to exact board name
    And I delete the board

  # VH - 639
  Scenario: Publishing Image to a pinterest for an existing board
    When I switch to 'Auto QA Beta' organization
    Then I click on Publish button
    And I select Publish a message
    When I select 'autoqa0079' accounts
    Then I finish accounts selection
    Then I add a message
    Then I select to Upload image
    And I select 'book1.jpg' for uploading
    Then I finish image attach
    Then I select the existing board name from dropdown
    And I do not see board description
    And I verify the message for board name publishing in summary
    And I publish the message
    Then I verify the publish was succesfully
    Then I verify the published message on messages to exact board name
    And I verify the published message on platform to exact board

  Scenario: Publishing to a group accounts including pinterest for existing board
    When I switch to 'Auto QA Beta' organization
    Then I click on Publish button
    And I select Publish a message
    When I select 'group_account' accounts
    And I select 'autoqa0079' accounts
    Then I finish accounts selection
    Then I select to Upload image
    And I select an image set of 6 images for uploading
    And I insert 'fb album' as album name for facebook
    Then I finish image attach
    And I should be able to see '6' images attached
    Then I select the existing board name from dropdown
    And I do not see board description
    And I verify the message for board name publishing in summary
    And I see the limit set for twitter images upload
    And I verify that just the first image will be publish on pinterest
    And I publish the message
    Then I verify the publish was succesfully
    Then I verify the published message on messages to exact board name
    And I verify the published message on platform
