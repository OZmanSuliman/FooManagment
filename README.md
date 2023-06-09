# FooManagment
the name got selected because the word food has close pronunciation as Food
and Foo is commonly used in developers examples as a variable name.
The App is developed using XCode 14.2, Swift Swift 5.7, UIKit, and tested on iPhone 13, iOS 16.4.1.


https://user-images.githubusercontent.com/39956261/235357404-16a2e17d-6f36-48e9-8db9-44d2fdfbd9f3.MP4


## Architecture
The Project built on [Clean Swift architure](https://clean-swift.com).
![alt text](http://clean-swift.com/wp-content/uploads/2015/08/VIP-Cycle.png)

## SOLID
The Project is implementing the SOLID principles in all its cycle.

## Multi Environments
There are 3 environments in the project
- Development
- Release
- Staging

each enviroment has its own scheme and configuration .

## UI
The UI is responsive and support Multi Orientation + Dark and Light modes.

## Reusability
as part of the architure, the project compenents are highly losed which makes them reusable.

## Data Source
### Remote
currently the project doesn't has cloud data support, but the network service is already implemented which make the support 
of the cloud data easly in future.

### Local
The database used in the project is Realm Swift (https://realm.io/realm-swift)
the reason behind that is the impelementaion of realm database is faster than CoreData and there is no big differences on the
stability between the 2 databases, so I followed the system design role that's says 
"always use the use the minimum if it serve the requirements". if the database contained complecated data and refrences, then CoreData
would be more useful.

## CI/CD
The Github repository has 2 workflows;
- the development workflow got triggered when there is a push or a pull requests to the development scheme, it builds, runs 
UI and Unit tests on the Dev environment (using its scheme).
- the main one which is get triggered from the pull requests and pushes to the main branch, it uses the release scheme for build,
unit test, and UI testing. Currently there is no deploy to Appstore since the project isn't in the Appstore.

## Automated Tests
Due to some confilict on the time, the app was developed in less than 2 days, which prevent from adding Unit and UI tests.
as mentioned above, the app is highly losed which makes is easy for tests as well.

## Design pattern
These are examples for design patterns used in the app and not included to:
### Singleton
example for its usage in the app: EnvironmentManager
### Factory
example for its usage in the app: ServicesFactory
### Bridge
example for its usage in the app: Configuration elements
### Facade
example for its usage in the app: Interactor elements
