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
  Given The Timer menu
  When I tap the number on the screen
  And I insert a time in "Set Time"
  And I tap "Save"
  Then The time changes in the pomodoro
```

<img width="189" alt="story2" src="https://user-images.githubusercontent.com/92645980/224540044-2d81d2f9-a2fd-45e9-9d13-943047efeb04.png">

### Story 2
As a distracted user, I want the timer to have a vibrating alert option, as well as a sound alert, so that I can be alerted when a pomodoro session is over.
### Acceptance tests
```Gherkin
Scenario: Pomodoro session is over
  Given The Timer menu
  When I select the option "Sound Alert
  And The timer ends
  And I finish study
  Then The app gives a sound alert
```

<img width="186" alt="story1" src="https://user-images.githubusercontent.com/92645980/224540035-486e7631-f5ea-4751-8e09-b394328e916f.png">

### Story 3
As someone with a phone addiction, I want the timer to have a distraction-free mode so that I can focus without being interrupted by notifications or tempted to check social media.
### Acceptance tests
```Gherkin 
Scenario: Distraction-free mode
  Given A student, the timer settings menu, the timer menu
  When I select "Focus mode"
  And I select "Focus mode"
  And I start the timer
  Then I can't leave the app
```

<img width="318" alt="story3" src="https://user-images.githubusercontent.com/92645980/224555457-cc8b76a1-b089-4b71-b276-b79e1ed98ae5.png">

### Story 4
As a teacher, I want to be able to pause the timer during a pomodoro session so that I can help my students if they come into my office hours without losing my progress.
### Acceptance tests
```Gherkin 
Scenario: Pause pomodoro session
  Given A teacher that needs to help a student
  When I tap "Pause Session"
  Then The timer pauses
```

<img width="214" alt="story4" src="https://user-images.githubusercontent.com/92645980/224538853-7df07514-0ad8-422f-a5b5-84aa69ee4838.png">

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

<img width="189" alt="story5" src="https://user-images.githubusercontent.com/92645980/224539028-a205629d-db14-496a-93b6-207c3edcbacd.png">

### Story 6
As a student, I want to have be informed of the best places to study and if their occupancy.
### Acceptance tests
```Gherkin 
Scenario: Find a nice place
  Given A list of places to study
  When I click on a place to study
  Then I see the place's rating, comments about it and occupancy
```

<img width="200" alt="story6" src="https://user-images.githubusercontent.com/92645980/224554183-8097f47f-d682-4f7c-bdfb-f062f82549cd.png">

### Story 7
As a student, I want to view the rates and comments of the places to study as to choose the best one.
### Acceptance tests
```Gherkin 
Scenario: See rating and comments of a talk
  Given A place to study
  When I am in the place to study's page
  Then the current rating and comments appears
```

<img width="311" alt="story7" src="https://user-images.githubusercontent.com/92645980/224556838-22ceedd4-2c2b-4c52-ab2b-dbeee762720a.png">

### Story 8
As a user, I want to view how long I have been focused during a month period.
### Acceptance tests
```Gherkin 
Scenario: Look at my focus time during a month
  Given The Progress page
  When I change the month to the one i want
  Then I see my progress in that month
```

<img width="185" alt="story8" src="https://user-images.githubusercontent.com/92645980/224545618-73b82fb9-0fa9-48a7-a642-6d8ef07f2095.png">

### Story 9
As a user, I want to view what rewards I have earned so far.
### Acceptance tests
```Gherkin 
Scenario: See the hours i got so far
  Given My main page
  When I click on "Shop Icon"
  Then I see the hours i have worked so far
```

<img width="218" alt="story9" src="https://user-images.githubusercontent.com/92645980/224543783-fb2bb8ff-4ae4-4c56-81ab-6f4fb5e75d9a.png">

### Story 10
As a user, I want to view how much I have contributed to FEUP's student-in-need scholarship.
### Acceptance tests
```Gherkin 
Scenario: See how much I have contributed to FEUP's student-in-need scholarship
  Given The scholarship page
  When I click on "Contribution"
  Then I see my contribution so far
```

<img width="184" alt="story10" src="https://user-images.githubusercontent.com/92645980/224545582-dace2c7e-66a6-4e6c-b662-f593a175a3bf.png">

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

<img width="248" alt="story11" src="https://user-images.githubusercontent.com/92645980/224538905-e814f108-40f6-4726-afc7-5e88dca58f52.png">

## Domain model

![UML](https://user-images.githubusercontent.com/114337746/224555235-6792c6df-eddb-4e2e-8259-8dcb932a5787.png)
