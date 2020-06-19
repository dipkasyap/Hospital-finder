
# Hospital finder 
## Requirements:
* iOS 13.0+
* Xcode 11.4.1
* Swift 5.0

## Objective:
App Goal:
* This project helps to prevent hospitals form overflow by providing easy interface to check waiting time for specefic type of illness and level of pain that patient is suffering from. 
* The app uses two APIs, firt to fetch illnesses and second to hospitas.
  1. http://dmmw-api.australiaeast.cloudapp.azure.com:8080/illnesses
  2. http://dmmw-api.australiaeast.cloudapp.azure.com:8080/hospitals

  
App Flow:

* App presents a list of illnesses to user.
* User selects select the illness he/shes suffering from. 
* App presents screen to select level of pain ranges from low to dengerous (coded as 0 to 4).
* User selects level of pain. 
* App calculates waiting times based on the patient’s level of pain and hospitals average process times and shows hospitals back to the user ordered by waiting time (Shortest to longest)
* Persists data using Realm DB.
* Bonus: User can select hospital from list and app will open map to provide rout to hospital.

## Installation

- Xcode **11.4.1**(required)
- Clean `/DerivedData` folder if any and build the project in Xcode

## 3rd Party Libraries

 - **`SVProgressHUD`** - [SVProgressHUD](https://github.com/SVProgressHUD/SVProgressHUD) is used to show loading indicator when app calls api to get data. 
 - **`NotificationBannerSwift`** - [NotificationBannerSwift](https://github.com/Daltron/NotificationBanner) Banner alert, it is used to show alert banner if app encounters error on API fetch. 
 - **`RealmSwift`** - [RealmSwift](https://realm.io/docs/swift/latest) Is Object store DB, it is used to store user info about illness, pain and selected hospital. 
