Feature: Nopcommerce Registration

  As a user, I want to check the Register functionality of Nopcommerce

  Background: I am on Nopcommerce Registration page
    Given I open the Google Chrome Browser
    When I open the URL https://demo.nopcommerce.com/register
    Then I am on Nopcommerce Registration page

  Scenario Outline: I should not be able to register with invalid data on mandatory field (*) of registration page
    When I enter First Name "<first name>"
    And I enter Last Name "<last name>"
    And I enter Email address "<email>"
    And I enter Password "<password>"
    And I enter Confirm Password "<confirm password>"
    And Click on Register button
    Then I can see an error message "<error message>"
    And I am not able to register
    Examples:
      | first name | last name | email            | password | confirm password | error message                              |
      | ""         | Bakshi    | bakshi@gmail.com | 456897   | 456897           | please enter First Name                    |
      | Rohan      | ""        | bakshi@gmail.com | 456897   | 456897           | please enter Last Name                     |
      | Rohan      | Bakshi    | ""               | 456897   | 456897           | please enter valid Email                   |
      | Rohan      | Bakshi    | bakshi@gmail.com | ""       | 456897           | password is required                       |
      | Rohan      | Bakshi    | bakshi@gmail.com | 456897   | ""               | confirm password is required               |
      | Rohan      | Bakshi    | bakshi@gmail.com | 456897   | 45689            | password and confirm password do not match |
      | Rohan      | Bakshi    | bakshi@gmail.com | 45689    | ""               | minimum 6 character password is required   |
      | ""         | Bakshi    | bakshi@gmail.com | ""       | ""               | Mandatory (*) field is required            |

  Scenario: I should be able to select any one radio button from Gender Label of Your Personal Details section
    Given I am on Gender Label of Your Personal Details section
    When I select "Male" radio button
    And I select "Female" radio button
    Then I am able to select any one of the radio button

  Scenario Outline: Is should be able to select Day, Month and Year from drop down list of Date of birth field
    Given i am on Date of Birth field of Your Personal Detail section
    When I select Day "<day>"
    And I select Month "<month>"
    And I select Year "<year>"
    Then I am able to select Day, Month and Year from drop down list
    Examples:
      | day | month    | year |
      | 11  | November | 1989 |

  Scenario: I should be able to check and uncheck the Newsletter box on Options section
    Given i am on Newsletter label on Options section
    When i click on Newsletter checkbox
    And I again click on Newsletter checkbox
    Then I was able to check and uncheck the box next to Newsletter label

  Scenario: I should be able to register with valid mandatory (*) field data on registration page
    When I enter First Name "Rohan"
    And I enter Last Name "Bakshi"
    And I enter Email "bakshi@gmail.com"
    And I enter Password "456897"
    And I enter Confirm Password "456897"
    And I click on Register button
    Then I was able to register successfully
