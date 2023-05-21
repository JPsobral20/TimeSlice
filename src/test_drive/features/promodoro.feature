Feature: Login Screen Validates the Login
  Scenario: When I have a password and email
    Given I have "emailfield" and "passwordfield" and "Loginbutton"
    When I fill the "emailfield" field with "jpasobral@hotmail.com"
    And I fill the "passwordfield" field with "123456"
    Then I tap the "Loginbutton" button
    Then I should have the "NavigationBar" on screen