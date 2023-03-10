# Architecture and Design
In this section we'll describe the logical and physical architectures of our project.

## Logical architecture
For the sake of our code maintenance and to be able to understand, we diveded our project in four parts: 
- `User Interfase`: Resposible for creating the screens and widgets that the user can see and use work on the app.
- `Database`: Communication between our database and app business logic, so that we can withdraw the information from the cloud and also upload some other information.  
- `TimeSlice Business Logic`: Resposible for the communication between our database and app UI. It's also responsible for the app's workflow.
- `External Services`: In control of the communications between the app and Google services or Sigarra (FEUP).

### Package diagram
![Package diagram](https://user-images.githubusercontent.com/113974128/224291809-30074430-c6c8-4c0f-8008-a6bcca282f57.png)

## Physical architecture
In our appication we got 4 entities: the Student Smartphone, the TimeSlice server, the Google server and the FEUP server.
![Physical architecture](https://user-images.githubusercontent.com/113974128/224361019-cc5cf5ac-6f42-4f71-a4e1-cdfbe88ca234.png)
<br>


## Prototype
- Our prototypes implements the counter in minutes with a limit, for now, of 25 minutes.
- The prototype is in a vertical image with a pre-established time in code. It has a start button for inicializing the counter and an option of pausing the counter and then the resume option.
