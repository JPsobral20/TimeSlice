# Requirements

## Use case model


|||
| --- | --- |
| *Name* | TimeSlice |
| *Actor* | Customer | 
| *Description* | The costumer is able to choose a pre-planned focus timer or personalise a new one. During the focus time set the user cannot leave the app and therefore can’t be distracted by their phone. If they are focus during a pre-determined amount of time this will be rewarded with coins that can be exchanged for goods at FEUP’s bar and it will also contribute to a scholarship funded by FEUP that goes to students in need. The costumer will also be able to check how long they have been focused during a month period and check the best and empty stops at FEUP to study. |
| *Preconditions* | - The customer is a student or a faculty member at FEUP. |
| *Postconditions* | - The customer is rewared with goods at FEUP's bar. <br> - The customer contributes for a scholarship. |
| *Normal flow* | 1. The customer accesses the appication. <br> 2. The customer logs in with FEUP's authentication. <br> 3. The system shows a timer. <br> 4. The customer chooses a pre-set one.<br> 5. The system get the counter running for the focus timer. <br> 6. The system rewards the time the costumer spent focused. <br>
| *Alternative flows and exceptions* | 1. In step 2, the customer can set their own timer.<br> 2. In step 4 the timer can also be the break timer. |

## User stories

### Story 1
As a student, I want to be able to customize the duration of my pomodoro sessions so that I can work according to my own productivity cycles.
### Acceptance tests
```Gherkin
Scenario: Customize the Pomodoro
  Given A Timer
  When I tap the number on the screen
  And I insert a time
  And I tap "OK"
  Then The time changes in the pomodoro
```
### Story 2
As a distracted user, I want the timer to have a vibrating alert option, as well as a sound alert, so that I can be alerted when a pomodoro session is over.
### Acceptance tests
```Gherkin
Scenario: Pomodoro session is over
  Given A Timer
  When The timer ends
  And I finish study
  Then The app gives a sound alert
```
### Story 3
As someone with a phone addiction, I want the timer to have a distraction-free mode so that I can focus without being interrupted by notifications or tempted to check social media.
### Acceptance tests
```Gherkin 
Scenario: Distraction-free mode
  Given A student
  When I tap "Distraction-free"
  And I start the timer
  Then I can't leave the app
```
### Story 4
As a teacher, I want to be able to pause the timer during a pomodoro session so that I can help my students if they come into my office hours without losing my progress.
### Acceptance tests
```Gherkin 
Scenario: Pause pomodoro session
  Given A teacher that needs to help a student
  When I tap "Pause Session"
  Then The timer pauses
```


### Story 5
As someone with multiple devices, I want to be able to login so that I can track my progress.



### Acceptance tests
```Gherkin 
Scenario: Login the app
  Given My login Screen
  When I write my email
  And I write my password
  Then the main page appears
```
### Story 6
As a student, I want to have be informed of the best places to study and if their occupancy.
### Acceptance tests
```Gherkin 
Scenario: Find a nice place
  Given A list of places to study
  When I click on a place to study
  Then I see the place's rating, comments about it and occupancy
```
### Story 7
As a student, I want to view the rates and comments of the places to study as to choose the best one.
### Acceptance tests
```Gherkin 
Scenario: See rating and comments of a talk
  Given A place to study
  When I am in the place to study's page
  Then the current rating and comments appears
```
### Story 8
As a user, I want to view how long I have been focused during a month period.
### Acceptance tests
```Gherkin 
Scenario: Look at my focus time during a month
  Given The Progress page
  When I change the mode to monthly
  And I click "Change"
  Then I see my progress per month
```
### Story 9
As a user, I want to view what rewards I have earned so far.
### Acceptance tests
```Gherkin 
Scenario: See the points i got so far
  Given My main page
  When I click on "Rewards"
  Then I see my points 
```
### Story 10
As a user, I want to view how much I have contributed to FEUP's student-in-need scholarship.
### Acceptance tests
```Gherkin 
Scenario: See how much I have contributed to FEUP's student-in-need scholarship
  Given The scholarship page
  When I click on "Contribution"
  Then I see my contribution so far
```
### Story 11
As a user, I want to be able to do a task list and check what I've done so far.
### Acceptance tests
```Gherkin 
Scenario: Look at my task list and check the task
  Given The task list page
  When I click on a task
  And I click on "Check"
  Then I see that task checked and the task I've checked so far
```

## Domain model

![UML](https://user-images.githubusercontent.com/114337746/223685499-434aafd8-49a8-43a9-a70d-8ea5354d6bea.png)

