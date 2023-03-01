# Requirements

## Use case model


|||
| --- | --- |
| *Name* | TimeSlice |
| *Actor* | Costumer | 
| *Description* | The costumer is able to choose a pre-planned focus timer or personalise a new one. During the focus time set the user cannot leave the app and therefore can’t be distracted by their phone. If they are focus during a pre-determined amount of time this will be rewarded with coins that can be exchanged for goods at FEUP’s bar and it will also contribute to a scholarship funded by FEUP that goes to students in need. The costumer will also be able to check how long they have been focused during a month period and check the best and empty stops at FEUP to study. |
| *Preconditions* | - The customer is a student or a faculty member at FEUP. |
| *Postconditions* | - The customer is rewared with goods at FEUP's bar. <br> - The customer contributes for a scholarship. |
| *Normal flow* | 1. The customer accesses the appication. <br> 2. The customer logs in with FEUP's authentication. <br> 3. The system shows a timer. <br> 4. The customer chooses a pre-set one.<br> 5. The system get the counter running for the focus timer. <br> 6. The system rewards the time the costumer spent focused. <br>
| *Alternative flows and exceptions* | 1. In step 2, the customer can set their own timer.<br> 2. In step 4 the timer can also be the break timer. |

## User stories

* As a student, I want to be able to customize the duration of my pomodoro sessions so that I can work according to my own productivity cycles.
* As a distracted user, I want the timer to have a vibrating alert option, as well as a sound alert, so that I can be alerted when a pomodoro session is over.
* As someone with a phone addiction, I want the timer to have a distraction-free mode so that I can focus without being interrupted by notifications or tempted to check social media.
* As a teacher, I want to be able to pause the timer during a pomodoro session so that I can help my students if they come into my office hours without losing my progress.
* As someone with multiple devices, I want to be able to log in so that I can track my progress.
* As a student, I want to have be informed of the best places to study and if their occupancy.
* As a student, I want to view the rates and comments of the places to study as to choose the best one.

## Domain model

![UML](https://user-images.githubusercontent.com/114337746/222103513-c77368b5-4768-476b-9a8b-ce931c36d4bd.png)
