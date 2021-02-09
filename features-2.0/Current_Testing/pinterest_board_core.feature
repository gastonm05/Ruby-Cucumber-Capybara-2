 ######################################################################################################################

          # Verifying Publishing on Pinterest new board core functionalities

 ######################################################################################################################

@selenium @newui   @pinterest_board_core @regression @regression_full @new_regression
Feature: Publishing images to Pinterest board

  Background:
    Given I am an existing user 'autoqa'
    Given I login using quick page object

  #VH - 476
  Scenario: Publishing a .jpg image to pinterest new board
    Then I click on Publish button
    And I select Publish a message
    When I select account 'viralheatqatest' to publish
    Then I finish accounts selection
    Then I add a message
    Then I select to Upload image
    And I select 'book1.jpg' for uploading
    Then I finish image attach
    Then I enter 'board_name' as board name for pinterest
    And I enter 'board_description' as board description for pinterest
    And I publish the message
    Then I verify the publish was succesfully
    Then I navigate to sources page
    And I select view on platform for 'viralheatqatest'
    And I switch Selenium current page for the new tab opened
    And I verify there is a board 'board_name'
    And I switch back to Selenium current page from the new tab opened

  #VH-477
  Scenario: Publishing a .gif image to pinterest
    Then I click on Publish button
    And I select Publish a message
    When I select account 'viralheatqatest' to publish
    Then I finish accounts selection
    Then I add a message
    Then I select to Upload image
    And I select 'gif1.gif' for uploading
    Then I finish image attach
    Then I enter 'board_name' as board name for pinterest
    And I enter 'board_description' as board description for pinterest
    And I publish the message
    Then I verify the publish was succesfully
    Then I navigate to sources page
    And I select view on platform for 'viralheatqatest'
    And I switch Selenium current page for the new tab opened
    And I verify there is a board 'board_name '
    And I switch back to Selenium current page from the new tab opened

 #VH-564
  Scenario: Publishing a .png image to pinterest
    Then I click on Publish button
    And I select Publish a message
    When I select account 'viralheatqatest' to publish
    Then I finish accounts selection
    Then I add a message
    Then I select to Upload image
    And I select 'homepage.png' for uploading
    Then I finish image attach
    Then I enter 'board_name' as board name for pinterest
    And I enter 'board_description' as board description for pinterest
    And I publish the message
    Then I verify the publish was succesfully
    Then I navigate to sources page
    And I select view on platform for 'viralheatqatest'
    And I switch Selenium current page for the new tab opened
    And I verify there is a board 'board_name'
    And I switch back to Selenium current page from the new tab opened

#VH-566
  Scenario: Publishing an image using URL to pinterest
    Then I click on Publish button
    And I select Publish a message
    When I select account 'viralheatqatest' to publish
    Then I finish accounts selection
    Then I add a message
    Then I select to Upload image
    And I choose to attach an image by URL "http://www.enchantedlearning.com/dgifs/Dolphin_color.GIF"
    Then I click on attach file
    Then I finish image attach
    Then I enter 'board_name' as board name for pinterest
    And I enter 'board_description' as board description for pinterest
    And I publish the message
    Then I verify the publish was succesfully
    Then I navigate to sources page
    And I select view on platform for 'viralheatqatest'
    And I switch Selenium current page for the new tab opened
    And I verify there is a board 'board_name'
    And I switch back to Selenium current page from the new tab opened

    #VH-643 #VH - 640
  Scenario: Publishing Image to a pinterest for an existing board
    Then I click on Publish button
    And I select Publish a message
    When I select account 'viralheatqatest' to publish
    Then I finish accounts selection
    Then I add a message
    Then I select to Upload image
    And I select 'book1.jpg' for uploading
    Then I finish image attach
    Then I enter 'board_name' as board name for pinterest
    And I enter 'board_name' as message
    And I do not see board description
    And I verify the message for 'board_name' publishing in summary
    And I publish the message
    Then I verify the publish was succesfully
    And I navigate to messages page
    And I verify there is a message in the calendar with 'board_name'
    Then I navigate to sources page
    And I select view on platform for 'viralheatqatest'
    And I switch Selenium current page for the new tab opened
    And I verify there is a board 'board_name'
    And I switch back to Selenium current page from the new tab opened

  Scenario: Publishing a .gif image to pinterest
    Then I click on Publish button
    And I select Publish a message
    When I select account 'viralheatqatest' to publish
    Then I finish accounts selection
    Then I add a message
    Then I select to Upload image
    And I select 'gif1.gif' for uploading
    Then I finish image attach
    Then I enter 'board_name' as board name for pinterest
    And I enter 'board_description' as board description for pinterest
    And I publish the message
    Then I verify the publish was succesfully
    Then I navigate to sources page
    And I select view on platform for 'viralheatqatest'
    And I switch Selenium current page for the new tab opened
    And I verify there is a board 'board_name '
    And I switch back to Selenium current page from the new tab opened


  Scenario: Publishing a .png image to pinterest
    Then I click on Publish button
    And I select Publish a message
    When I select account 'viralheatqatest' to publish
    Then I finish accounts selection
    Then I add a message
    Then I select to Upload image
    And I select 'homepage.png' for uploading
    Then I finish image attach
    Then I enter 'board_name' as board name for pinterest
    And I enter 'board_description' as board description for pinterest
    And I publish the message
    Then I verify the publish was succesfully
    Then I navigate to sources page
    And I select view on platform for 'viralheatqatest'
    And I switch Selenium current page for the new tab opened
    And I verify there is a board 'board_name'
    And I switch back to Selenium current page from the new tab opened


  Scenario: Publishing an image using URL to pinterest
    Then I click on Publish button
    And I select Publish a message
    When I select account 'viralheatqatest' to publish
    Then I finish accounts selection
    Then I add a message
    Then I select to Upload image
    And I choose to attach an image by URL "http://www.enchantedlearning.com/dgifs/Dolphin_color.GIF"
    Then I click on attach file
    Then I finish image attach
    Then I enter 'board_name' as board name for pinterest
    And I enter 'board_description' as board description for pinterest
    And I publish the message
    Then I verify the publish was succesfully
    Then I navigate to sources page
    And I select view on platform for 'viralheatqatest'
    And I switch Selenium current page for the new tab opened
    And I verify there is a board 'board_name'
    And I switch back to Selenium current page from the new tab opened

  Scenario: Publishing Image to a pinterest for an existing board
    Then I click on Publish button
    And I select Publish a message
    When I select account 'viralheatqatest' to publish
    Then I finish accounts selection
    Then I add a message
    Then I select to Upload image
    And I select 'book1.jpg' for uploading
    Then I finish image attach
    Then I enter 'board_name' as board name for pinterest
    And I enter 'board_name' as message
    And I do not see board description
    And I verify the message for 'board_name' publishing in summary
    And I publish the message
    Then I verify the publish was succesfully
    And I navigate to messages page
    And I verify there is a message in the calendar with 'board_name'
    Then I navigate to sources page
    And I select view on platform for 'viralheatqatest'
    And I switch Selenium current page for the new tab opened
    And I verify there is a board 'board_name'
    And I switch back to Selenium current page from the new tab opened

    Scenario: Verifying that stream contains pins from my own account
    # ToDo this should be done publishing a message to pinterest, storing it on 
    # Redis or something like that and then checking on the stream.
    # Refactor asap
    Then I navigate to stream page
    # This is to have more accurated and quicker results
    And I click on streams change filter
    And I click on 'pinterest'
    And I select the 'viralheatqatest' pinterest account
    And I verify last pin from the 'viralheatqatest' pinterest account on stream
#VH-742   
    Scenario: Publishing a .jpg image to pinterest new board
    Then I click on Publish button
    And I select Publish a message
    When I select account 'viralheatqatest' to publish
    Then I finish accounts selection
    Then I add a message
    Then I select to Upload image
    And I select 'book1.jpg' for uploading
    Then I finish image attach
    Then I enter 'board_name' as board name for pinterest
    And I enter 'board_description' as board description for pinterest
    And I publish the message
    Then I verify the publish was succesfully
    Then I navigate to messages page
    Then I open the pin status
    Then I delete the pin
    And I verify the pin is deleted