 ######################################################################################################################

         # Verifying the Image upload functionalities for private account

 ######################################################################################################################

@selenium @newui @image_upload_core @regression @regression_full @new_regression
Feature: Images uploading by Attach a URL or Upload an image

  Background:
    Given I am an existing user 'autoqa'
    Given I login using page object

  Scenario: I can attach an image by url to publish on a private single account
    Then I click on Publish button
    And I select Publish a message
    When I select 'group_account' accounts
    Then I finish accounts selection
    Then I select to Upload image
    And I choose to attach an image by URL "http://cision-wp-files.s3.amazonaws.com/us/wp-content/uploads/2015/01/homepage.png"
    Then I click on attach file
    Then I finish image attach
    And I should be able to see the image attached
    Then I verify the publish was succesfully

  Scenario: I can attach an image by uploading to publish on a private single account
    Then I click on Publish button
    And I select Publish a message
    When I select 'group_account' accounts
    Then I finish accounts selection
    Then I select to Upload image
    And I choose to attach an image "homepage.png" by uploading
    And I wait for 5 seconds
    Then I finish image attach
    And I should be able to see the image attached
    Then I verify the publish was succesfully


  Scenario: I can remove an image after uploading to a private single account
    Then I click on Publish button
    And I select Publish a message
    When I select 'group_account' accounts
    Then I finish accounts selection
    Then I select to Upload image
    And I choose to attach an image "homepage.png" by uploading
    And I wait for 5 seconds
    Then I finish image attach
    And I should be able to see the image attached
    Then I select to Upload image
    And I remove the attached image
    Then I should see the image being removed


  Scenario: I can remove an image after attach by url to a private single account
    Then I click on Publish button
    And I select Publish a message
    When I select 'group_account' accounts
    Then I finish accounts selection
    Then I select to Upload image
    And I choose to attach an image by URL "http://cision-wp-files.s3.amazonaws.com/us/wp-content/uploads/2015/01/homepage.png"
    Then I click on attach file
    Then I finish image attach
    And I should be able to see the image attached
    Then I select to Upload image
    And I remove the attached image
    Then I should see the image being removed

# Scenarios for multiple image upload

  Scenario: Multi Image upload for twitter
    Then I click on Publish button
    And I select Publish a message
    When I select 'twitter_account' accounts
    Then I finish accounts selection
    Then I select to Upload image
    And I select an image set of 6 images for uploading
    And I should be able to see '6' images attached
    And I see the limit set for twitter images upload
    And I publish the message
    Then I finish image attach
    Then I verify the publish was succesfully

# Scenarios for multiple image upload with link and file upload.

  Scenario: Multi Image upload for twitter and facebook
    Then I click on Publish button
    And I select Publish a message
    When I select 'group_account' accounts
    Then I finish accounts selection
    Then I select to Upload image
    And I choose to attach an image by URL "http://cision-wp-files.s3.amazonaws.com/se/wp-content/uploads/2015/10/cision-logo-rebranded.png"
    Then I click on attach file
    And I select an image set of 6 images for uploading
    And I insert 'fb album' as album name for facebook
    Then I finish image attach
    And I should be able to see '7' images attached
    And I see the limit set for twitter images upload
    And I publish the message
    Then I verify the publish was succesfully

  Scenario: verifying deleting the image after uploading
    Then I click on Publish button
    And I select Publish a message
    When I select 'twitter_account' accounts
    Then I finish accounts selection
    Then I select to Upload image
    And I select an image set of 6 images for uploading
    And I should be able to see '6' images attached
    And I delete first image
    And I should be able to see '5' images attached
    Then I finish image attach

# Scenarios for multiple image upload with link and file upload.

  Scenario: verifying multiple images upload with urls
    Then I click on Publish button
    And I select Publish a message
    When I select 'twitter_account' accounts
    Then I finish accounts selection
    Then I select to Upload image
    And I choose to attach an image by URL "http://cision-wp-files.s3.amazonaws.com/se/wp-content/uploads/2015/10/cision-logo-rebranded.png"
    Then I click on attach file
    And I choose to attach an image by URL "http://www.enchantedlearning.com/dgifs/Dolphin_color.GIF"
    Then I click on attach file
    And I should be able to see '2' images attached
    And I publish the message
    Then I verify the publish was succesfully

 # When targeting is set for facebook, then only a single image (first image) will be published.
@check
  Scenario: Multi Image uploading with targeting
    Then I click on Publish button
    And I select Publish a message
    When I select 'group_account' accounts
    Then I finish accounts selection
    Then I select to Upload image
    And I select an image set of 6 images for uploading
    And I insert 'fb album' as album name for facebook
    Then I finish image attach
    And I should be able to see '6' images attached
    And I see the limit set for twitter images upload
    And I select facebook targeting
    And I select 'Argentina' as country to target on facebook
    And I verify that just the first image will be publish on facebook
    And I publish the message
    Then I verify the publish was succesfully