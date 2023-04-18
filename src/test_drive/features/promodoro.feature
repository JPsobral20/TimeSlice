Feature: Promodoro Clock
  Scenario: Pause pomodoro session
    Given A user that needs to stop the timer
    When I tap the "Pause" button
    Then The timer pauses