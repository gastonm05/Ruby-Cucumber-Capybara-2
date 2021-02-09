 ######################################################################################################################

         # Tests for public Organization Auto QA Beta and VH QA ORG2

 ######################################################################################################################

@selenium @newui @publish_a_message_extended @regression_full
Feature: Images uploading by Attach a URL or Upload an image

  Background:
    Given I am an existing user 'autoqa'
    Given I login using page object

#VH-584
  Scenario: I can attach an image by url to publish on a public group account
    When I switch to 'Auto QA Beta' organization
    Then I click on Publish button
    And I select Publish a message
    When I select 'group_account' accounts
    Then I finish accounts selection

    Then I select to Upload image
    And I choose to attach an image by URL "http://cision-wp-files.s3.amazonaws.com/us/wp-content/uploads/2015/01/homepage.png"
    Then I click on attach file
    Then I finish image attach
    And I should be able to see the image attached

#VH-565
  Scenario: I can attach a png image by uploading to publish on a public group account
    When I switch to 'Auto QA Beta' organization
    Then I click on Publish button
    And I select Publish a message
    When I select 'group_account' accounts
    Then I finish accounts selection
    Then I select to Upload image
    And I choose to attach an image "homepage.png" by uploading
    And I wait for 5 seconds
    Then I finish image attach
    And I should be able to see the image attached

    #VH-478
  Scenario: I can attach a jpg image by uploading to publish on a public group account
    When I switch to 'Auto QA Beta' organization
    Then I click on Publish button
    And I select Publish a message
    When I select 'group_account' accounts
    Then I finish accounts selection
    Then I select to Upload image
    And I choose to attach an image "book1.jpg" by uploading
    And I wait for 5 seconds
    Then I finish image attach
    And I should be able to see the image attached

    #VH-563
  Scenario: I can attach a gif image by uploading to publish on a public group account
    When I switch to 'Auto QA Beta' organization
    Then I click on Publish button
    And I select Publish a message
    When I select 'group_account' accounts
    Then I finish accounts selection
    Then I select to Upload image
    And I choose to attach an image "gif1.gif" by uploading
    And I wait for 5 seconds
    Then I finish image attach
    And I should be able to see the image attached

   Scenario: Multi Image upload for twitter to a public org
    Then I switch to 'VH QA Org 2' organization
    Then I click on Publish button
    And I select Publish a message
    When I select 'twitter_account' accounts
    Then I finish accounts selection
    Then I select to Upload images
    And I select 'Image_set1' images by uploading
    Then I finish image attach
    And I should be able to see the image attached
    Then I add a message
    And I see the limit set for twitter images upload
    And I publish the message
    Then I verify the message in calendar with multiple images
    And I verify the published message on platforms with the set limit images
    And I verify the message with multiple images on platform

  Scenario: Multi image upload to facebook to a public org
     Then I switch to 'VH QA Org 2' organization
     Then I click on Publish button
     And I select Publish a message
     When I select 'facebook_page' accounts
     Then I finish accounts selection
     Then I select to Upload images
     And I select 'Image_set1' images by uploading
     And I select 'Image_set2' images by uploading
     Then I finish image attach
     And I should be able to see the image attached
     Then I add a message
     And I see the limit set for twitter images upload
     And I publish the message
     Then I verify the message in calendar with multiple images
     And I verify the published message on platforms with the set limit images
     And I verify the message with multiple images on platform

  Scenario: Multi Image upload for twitter and facebook to a public org
    Then I switch to 'VH QA Org 2' organization
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
    Then I add a message
    And I see the limit set for twitter images upload
    And I publish the message
    Then I verify the message in calendar with multiple images
    And I verify the published message on platforms for twitter with set limit
    And I verify the message with multiple images on facebook platform with album name

  # VH - 582
  Scenario:Multi Image upload for twitter and facebook and reposting the same with different accounts and added images to a public org
    Then I switch to 'VH QA Org 2' organization
    Then I click on Publish button
    And I select Publish a message
    When I select 'group_account' accounts
    Then I finish accounts selection
    Then I select to Upload images
    And I select 'Image_set3' images by uploading
    And I select 'Image_set4' images by uploading
    And I enter the album name as 'FB Album for publishing multi images'
    Then I finish image attach
    And I should be able to see the image attached
    Then I add a message
    And I see the limit set for twitter images upload
    And I publish the message
    Then I verify the message in calendar with multiple images
    And I verify the published message on platforms for twitter with set limit
    And I verify the message with multiple images on facebook platform with album name
    And I navigate to the same message in calendar
    Then I repost the message
    And I remove the accounts from list and add 'group_account3' accounts
    Then I select to Upload images
    And I select 'Image3' images by uploading
    And I select 'Image4' images by uploading
    And I repost the message
    Then I verify the repost message in calendar with multiple images
    And I verify the reposted message on platforms for twitter with set limit
    And I verify the reposted message with multiple images on facebook platform with album name


  Scenario: Multi Image upload functionality with other platforms than twitter and facebook
    Then I switch to 'VH QA Org 2' organization
    Then I click on Publish button
    And I select Publish a message
    When I select 'vhqa1-1' accounts
    Then I finish accounts selection
    Then I select to Upload images
    And I select 'Image_set3' images by uploading
    And I select 'Image_set4' images by uploading
    Then I see an error message not allowing to add multiple images
    Then I finish image attach
    And I should be able to see the image attached
    Then I add a message
    And I publish the message
    Then I verify the message in calendar with single image
    And I verify the message with single image on platform


Scenario: Multi Image uploading with targeting
    When I switch to 'Auto QA Beta' organization
    Then I click on Publish button
    And I select Publish a message
    When I select 'group_account' accounts
    Then I finish accounts selection
    Then I select to Upload images
    And I select 'Image_set3' images by uploading
    And I enter the album name as 'FB Album for publishing multi images'
    Then I finish image attach
    And I should be able to see the image attached
    Then I add a message
    And I see the limit set for twitter images upload
    And I select facebook targeting
    Then I choose 'set2' in targeting
    And I am done with targeting set
    And I publish the message
    Then I verify the message in calendar with multiple images

  # When targeting is set for facebook, then only a single image (first image) will be published.

    And I verify the published message on platform for twitter with set limit
    And I verify the message with images on facebook platform with album name

  Scenario: Multi Image uploading with targeting and reposting
    When I switch to 'Auto QA Beta' organization
    Then I click on Publish button
    And I select Publish a message
    When I select 'group_account' accounts
    Then I finish accounts selection
    Then I select to Upload images
    And I select 'Image_set3' images by uploading
    And I enter the album name as 'FB Album for publishing multi images to public org'
    Then I finish image attach
    And I should be able to see the image attached
    Then I add a message
    And I see the limit set for twitter images upload
    And I select facebook targeting
    Then I choose 'set2' in targeting
    And I am done with targeting set
    And I publish the message
    Then I verify the message in calendar with multiple images

      # When targeting is set for facebook, then only a single image (first image) will be published.

    And I verify the published message on platform for twitter with set limit
    And I verify the message with images on facebook platform with album name
    And I navigate to the same message in calendar
    Then I repost the message
    And I remove the accounts from list and add 'group_account3' accounts
    Then I select to Upload images
    And I select 'Image3' images by uploading
    And I select 'Image4' images by uploading
    And I dont change the album name
    And I repost the message
    Then I verify the repost message in calendar with multiple images
    And I verify the reposted message on platforms for twitter with set limit
    #while reposting to the same album name, the album name appends with a number in reposted message

    And I verify the reposted message with single image on facebook platform with album name

  
  Scenario: Multi Image uploading with link
    When I switch to 'Auto QA Beta' organization
    Then I click on Publish button
    And I select Publish a message
    When I select 'group_account' accounts
    Then I finish accounts selection
    Then I select to Upload images
    And I select 'Image_set3' images by uploading
    And I enter the album name as 'FB Album for publishing multi images and link to public org'
    Then I finish image attach
    And I should be able to see the image attached
    When I add a message with a link 'https://utest-dl.s3.amazonaws.com/4777/3560/27369/null/bugAttachment/Bug677597_UpdateRoleWithBlankName.swf?AWSAccessKeyId=AKIAJVVOIXUIFRTEEEKQ&Expires=1466787356&Signature=yXbUnUA4islFnuzCvk4vq64OldQ%3D'
    And I wait for 5 seconds
    Then I shorten the link
    Then I preview the link
    And I am done with link preview
    And I see the limit set for twitter images upload
    And I publish the message
    Then I verify the message in calendar with multiple images

# When targeting is set for facebook, then only a single image (first image) will be published.

    And I verify the published message on platform for twitter with set limit
    And I verify the message with images on facebook platform with album name

#VH-692
Scenario: Appropriate validation message is displayed for Uploading invalid image format
    Then I click on Publish button
    And I select Publish a message
    When I select 'group_account' accounts
    Then I finish accounts selection
    Then I select to Upload image
    And I choose to attach an image "invalid.image" by uploading
    And I wait for 1 seconds
    Then I should see an error message