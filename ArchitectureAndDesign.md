## Architecture and Design
In this section we'll describe the logical and physical architectures of our project.
### Logical architecture
For the sake of our code maintenance and to be able to understand,we diveded our project in six parts: 
- `auth`: Resposible for the user login in the app. The login and signup backend are done by this module.  
- `database`: Communication between our database and some models of the app, so that the information from the cloud can be retrieved and also uploaded.  
- `model`: Models for each structure of database.
- `screens`: Responsible for drawing the app and allows the iteration user/application.  
- `widgets`: Module with useful widgets created by us.
## Package diagram

![Package diagram](https://user-images.githubusercontent.com/113974128/224028178-458f1259-2617-4048-94ce-c4e87d788e6b.png)
## Prototype
Our prototypes implements the counter in minutes with a limit, for now, of 25 minutes.
The prototype is in a vertical image with a pre-established time in code. It has a start button for inicializing the counter and an option of pausing the counter and then the resume option.
