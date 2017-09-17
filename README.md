# grailed

(Pardon our dust! This project is still ongoing.)

This is a sample project for testing out some ideas about code reuse. We have two API endpoints from which we want to extract data and we should reuse as much code as possible since there is a lot of similarities between them. This is quite a bit of overkill for such a simple project but I estimate about 95% of this code to be reusable.

Below I've listed some thoughts I want to call attention to as well as take note of things that were requested in the specification but are not yet implemented.

## VIPER Flows

This application uses a VIPER inspired architecture. Components are broken up into views (`UIViewController` objects and `UITableViewCell` objects) which lay implement the design, presenters which handle events and format information into readable versions, and interactors which handle the business logic. Breaking out into these components helps follow SOLID prinicples and allows us to swap components out easily at runtime and increases the amount of surface area we have for testing.

### Child VIPER Flows

Not all VIPER flows are associated with a `UIViewController`. By giving a VIPER heirarchy to a simple `UITableViewCell`, we can move complex processes like image downloading out of the `UITableViewDataSource` where it doesn't belong and into an object that is tied to the `UITableViewCell` lifecycle. No more image flickering issues. When a cell is reused, it is given a new presenter and the old presenter drops the response to any inflight network call on the floor.

### RouterType and FactoryType

Typically, `UIViewController` objects are created by the `UIViewController` before them and access data through singletons. Routers and factories attempt to clean this problem up. During launch, a map of routers is strung together with each router dictating where it can navigate to next. These routers are loaded up with factory classes that have all the dependencies they need to spit out a VIPER flow when called upon. This patten allows us to easily change up the flow of our app without having to touch any of our `UIViewController` objects. Routers can be configured to support `Route` objects which pair well with universal deeplinking.

## StoreType and NetworkType

Just as important as the presenters and interactors, VIPER flows store all of their data in `StoreType` objects. `StoreType` instances are passed to factories which are then tied to interactors. No singletons here, everything is dependency injected. Similar to `StoreType` we have `NetworkType`. These will be renamed to `SynchronousStoreType` and `AsynchronousStoreType` as both concepts serve the same purpose we just cannot hang around waiting to hear back from the network.

### Storable

Any object you plan to use with a `StoreType` or `NetworkType` (which should be all of it) gets a lot of free functionality from using the `Storable` type. The biggest feature of this protocol is being able to convert to and from JSON data to create a consistent format with which to communicate with many data stores. This could quite possibly be replaced in Swift 4 with `Codeable`.

### RequestsType and ResponsesType

The go between for `StoreType` and `Storable` objects are `RequestsType` and `ResponsesType`. These objects break all communication down to a consistent format in order to achieve dependency inversion. My `Article` doesn't know anything about the data store it lives in (unlike Core Data) and the data stores don't need specific functions for every model I create. This approach imposes a pretty rigid format and it carries a high upfront cost but it is worth it in the long run as you can get new models added to supported data stores very quickly.

### Functional Reactive Programming

When data is successfully pulled from the network and synced with a `StoreType` of your choice, a notification is sent out alerting any interested parties that there is fresh data to consume. This is a lightweight version of something like RxSwift but can be implemented without third-party support. This approach keeps our calls moving in one direction (views asking for data) and ensures that we only ever call an endpoint from one place.


## Remaining Tasks
1. Configure cells with custom views
2. Add image downloading to `ListableInteractor`
3. Move syncing logic to default protocol implementation for protocol composition reuse
4. Rewrite request and response types to be built around `Data` instead of `JSONDictionary`
5. Introduce `SeriailizerType` and `JSONSerializer` (but without name collision)
6. Add generics to `RequestsType` and properly set within `ReadRequestsType` and `WriteRequestsType`
7. Implement Codable protocol
8. Date parsing
9. Move majority of code into frameworks
10. Find solution for model-specific notifications.
11. Load whole tab bar at app launch.
