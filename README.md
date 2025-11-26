# QueensPuzzle
A SwiftUI implementation of the classic N-Queens puzzle, where the goal is to place N queens on an N×N board so none threaten each other.

 ## Technology
* Xcode 16.3

* Swift 5

* SwiftUI

* Unit Tests (XCTest)

## Core Gameplay

* Board sizes from 4 to 9

    * `<4` has no valid N-Queens solutions
    * `>9` above 9×9, the tiles shrink below Apple’s guideline of 44pt minimum tap target, making the board hard to use on an iPhone

* Tap to add/remove queens

* Real-time conflict highlighting

* Win detected only when:

    * exactly `N` queens are placed

    * no conflicts exist

* A celebratory win overlay appears with fade animation

* Reset functionality is always available

* Custom back button ensures clean state teardown

## To Run App and Tests

* Clone the repository

* Open `QueensPuzzle.xcodeproj`

* Run the app with `⌘ + R`

* Run all tests with `⌘ + U`

# Architecture Decisions

## Why MVVM?

`MVVM` creates a clean separation:

* `Model/Engine` holds puzzle logic

* `ViewModel` transforms model output into view-ready state

* `Views` built with `SwiftUI`, no business logic, only rendering

This improves clarity, testability, and scalability.

## Why a Domain Engine?

`NQueensEngine` contains all puzzle rules:

* tracking queen positions

* computing conflicts

* validating solution

It is:

* deterministic

* side-effect free

* UI-agnostic

This allows:

* predictable behavior

* simple unit testing

* future reuse (e.g. a macOS app)

`NQueensEngineProtocol` enables the `ViewModel` to depend on an abstraction, not a concrete class.

Benefits:

* easy mocking in tests

* extensibility (e.g. “TimedEngine”, “SolverEngine”)

* clean dependency injection
