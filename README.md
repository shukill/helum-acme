# ACME 

Health tracking application


#### Tools
    - GetX - Preferred over BLOC to reduce boiler code and get smoother user interaction
    - Firebase - Used as our NoSql database.


#### Layers:

**core**
    - contains [constants] mainly having app constants , such as base url , image paths and all
    - contains [styles] contains app text styles , common decoration and all

**views**
    - contains [modules] mainly dedicated folder for every relevent screen/state in the application
  
**modules** 
    - contains [components] to interact in presentation layer. All the common widgets for the widget tree
    - contains [controllers] get controllers to manage state across the application.
    - contains [models] for parsing external JSON from API.
    - contatins [services] for getting data from external api or local DB
# helum-acme
