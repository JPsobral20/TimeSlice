## Architecture and Design
In this section we'll describe the logical and physical architectures of our project.
### Logical architecture
For the sake of our code maintenance and to be able to understand,we diveded our project in six parts: 
- `auth`: Resposible for the user login in the app. The login and signup backend are done by this module.  
- `database`: Communication between our database and some models of the app, so as the information from the cloud can be retrieved and also uploaded.  
- `model`: Models for each structure of database.  
- `screens`: Module responsible for drawing the app and allows the iteration user/program.  
- `services`: Module that estabilish the communications between the app and FireStorage services. The main goal for this service is to upload and download stored images.  
- `widgets`: Module with useful widgets created by our team. These widgets were packet so as to be used in scale and mantain the code structure.   
## Package diagram
