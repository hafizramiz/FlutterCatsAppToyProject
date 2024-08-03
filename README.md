# cat_app_toy_project


Used Clan Architecture and Feature-First Structure implemented

- Clean Architecture
- State Management with Bloc
- DI (Dependency Injection) with get_it
- Feature-First Architecture
- Dio (Http requests)
- Exception handling, Multi Response


- I have seperated the project into 3 main features
  - Cats
  - Tiers
  - Shared
Cats and Tiers are two distinct features in the app. This is designed for modularity and to seperate features
But they share the same data source.
When you navigate to the Cats feature, the app fetches the data from the network and stores it in memory. 
When you navigate to the Tiers feature, the app uses the same data that was fetched for the Cats feature.
Cats feature uses only cats data. But Tiers feature not only uses  tiers, additionally currentTiers and
tierPoints.
Shared is responsible for features that are shared between the two features.

# Images <img src="https://user-images.githubusercontent.com/102408138/181803745-a7421993-ec40-4ac6-bc71-9f7cf25dbb4d.gif" width="50" height="50" />
![Screenshot_20240803_210318](https://github.com/user-attachments/assets/936a02e3-446d-42a9-a65b-1fbb0b057d51)
![Screenshot_20240803_210933](https://github.com/user-attachments/assets/3e4ce151-bc9a-4f83-a1fa-6d8067fc67b4)
