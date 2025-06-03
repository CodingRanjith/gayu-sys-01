## Architecture Standards

    We follow Layer architecture
    -  [Citation : Refer for More Details] (https://docs.flutter.dev/app-architecture)

## Layer Architecture

    UI Layer <-> Business Logic Layer <-> Data Layer

## UI Layer

    commonly termed as presentation in auth feature - [auth/presentation]
    keep UI widgets related to auth logic goes here
    bloc logic should go under - [auth/presentation/bloc]

## Data Layer

    data layer encapsulates

## Simple Feature flow

- [UI layer] An event occurs due to user interaction, such as a button being clicked. The widget's event handler callback invokes a method exposed by a class in the logic layer.
  [feature/auth/presentation/page]

- [Logic layer] The logic class calls methods exposed by a repository that know how to mutate the data.  
   [feature/auth/presentation/bloc]

- [Data layer] The repository updates data (if necessary) and then provides the new data to the logic class.
  [feature/auth/presentation/data/repository]

- [Logic layer] The logic class saves its new state, which it sends to the UI.
  [UI layer] The UI displays the new state of the view model.
  [feature/auth/presentation/bloc]
