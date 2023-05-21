Feature: Login
    Scenario: Login successful
        Given I'm in "LoginScreen" page
        And I have "emailField" and "passwordField" and "ForgotPasswordButton" and "LoginButton"
        When I fill the "emailField" field with "jpasobral@hotmail.com"
        And I fill the "passwordField" field with "123456"
        When I tap the "LoginButton" button
        Then I expect to be in "NavigationBar" page



