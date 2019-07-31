# WIL

[![Swift: >= 3.0](https://img.shields.io/badge/swift-%3E%3D%203.0-orange.svg)](https://medium.com/search?q=Romain%20Asnar%20swift)
[![Twitter: @romsi94](https://img.shields.io/badge/twitter-@romsi94-blue.svg)](https://twitter.com/romsi94)

Stay ahead of the best programming practices.

- [Installation](#installation)
- [iOS](#ios)
	- [Language Features](#language-features)
		- [Swift 4.2](#swift-4.2)
	- [Prototyping](#prototyping)
		- [User Interface](#user-interface)
- [Algorithm](#algorithm)
	- [Quicksort](#quicksort)
- [Design Pattern](#design-pattern)
	- [Visitor](#visitor)
- [Requirements](#requirements)

## Installation

1. [Download the Xcode 10.1 release](https://developer.apple.com/xcode/download/).
2. Clone this repository.

## iOS

Since iOS 4, I'm building iPhone and iPad apps. Major changes happen since then: ARC, storyboards, Swift and more. As an iOS engineer, I have to master the language, frameworks and the ecosystem.

My main regular source of information are:

- [WWDC](https://developer.apple.com/videos/wwdc2018)
- Podcast ([Swift by Sundell](https://itunes.apple.com/us/podcast/swift-by-sundell/id1267161825?mt=2), [Developing iOS 11 Apps with Swift](https://itunes.apple.com/us/podcast/developing-ios-11-apps-with-swift/id1315130780?mt=2))
- Youtube ([Sean Allen](https://www.youtube.com/channel/UCbTw29mcP12YlTt1EpUaVJw))
- Medium ([iOS](https://medium.com/tag/ios) / [Swift](https://medium.com/tag/swift) tag)
- Twitter ([John Sundell](https://twitter.com/johnsundell), [Pedro Piñera](https://twitter.com/pepibumur))
- Blogs ([Swift](https://swift.org), [Swift by Sundell](https://www.swiftbysundell.com), [objc.io](https://www.objc.io))

I'm mostly using Swift playground to try new things. In my opinion, [Swift playground is the best tool to quickly get feedbacks](https://medium.com/night-shift/spike-and-stabilize-only-works-if-afb3549426db).

### Language features

Apple support two languages for building iOS apps. Objective-C is a general-purpose, object-oriented programming language that adds Smalltalk-style messaging to the C programming language. Swift is a general-purpose, multi-paradigm, compiled programming language and designed to work with Apple's Cocoa and Cocoa Touch frameworks.

Both are maintained and Swift has been promoted by Apple engineering teams for years now.

Mastering the language is the basics to build iOS apps.

#### Swift 4.2

Swift 4.2 is now officially released! Swift 4.2 builds on the strengths of Swift 4, delivering faster compile times, improving the debugging experience, updating the standard library, and converging on binary compatibility.

You can watch a quick overview of it by watching the [WWDC 2018: What’s New in Swift presentation](https://developer.apple.com/videos/play/wwdc2018/401/), and try out some of the new features in [Ole Begemann playground](https://github.com/ole/whats-new-in-swift-4-2).

I tried Swift 4.2 new features in [Swift.playground](/Swift.playground) using `XCTest`:

- [SE-0054](https://github.com/apple/swift-evolution/blob/master/proposals/0054-abolish-iuo.md): Abolish ImplicitlyUnwrappedOptional type
- [SE-0194](https://github.com/apple/swift-evolution/blob/master/proposals/0194-derived-collection-of-enum-cases.md "Derived Collection of Enum Cases"): Derived Collection of Enum Cases
-  [SE-0199](https://github.com/apple/swift-evolution/blob/master/proposals/0199-bool-toggle.md): Adding toggle to Bool
-  [SE-0204](https://github.com/apple/swift-evolution/blob/master/proposals/0204-add-last-methods.md): Add last(where:) and lastIndex(where:) Methods
-  [SE-0197](https://github.com/apple/swift-evolution/blob/master/proposals/0197-remove-where.md): Adding in-place removeAll(where:) to the Standard Library
-  [SE-0185](https://github.com/apple/swift-evolution/blob/master/proposals/0185-synthesize-equatable-hashable.md): Synthesizing Equatable and Hashable conformance

### Prototyping

Prototype to learn. Prototypes are designed to answer just a few questions, so they are much cheaper and faster to develop than applications that go into production. Prototypes are designed to answer just a few questions, we can build many different prototypes to test a specific aspect:

- Architecture
- New functionality in an existing system
- Third-party tools or components
- User interface design

Let's try tools that made easy to build prototypes.

#### User Interface

Prototyping user interface enables the three amigos Product Owner, Developer and Tester to learn by quickly getting feedbacks. Storyboard is a great tool to create views by dragging/dropping elements into a view and mixed with Xcode Playgrounds, it allows developers to quickly run code and live updating views. Live coding while the three amigos discuss about user story, can dramatically reduce the feedback loop.

Apple describes Xcode Playgrounds as follow:

> [Interactive playgrounds (or Xcode playgrounds) help you to quickly prototype and build your applications, and simply provide another great way to interact with your code.](https://developer.apple.com/swift/blog/?id=35)

Recently during the WWDC 2018, [Apple team presents major advancements in Xcode playgrounds](https://developer.apple.com/videos/play/wwdc2018/402/). Learn advanced tips and techniques, hear about new and often overlooked workflows, and rediscover the tools provided when coding in playgrounds.

Check out the `User Intrerface` page on my [Prototyping playground file](/Prototyping.playground) where I use storyboards and Xcode playgrounds to build prototypes of my personal app.

## Algorithm & Data Structure

In computer science, an algorithm is a set of instructions, typically to solve a class of problems or perform a computation. Algorithms are unambiguous specifications for performing calculation, data processing, automated reasoning, and other tasks.

The goal is to describe how algorithms work. The focus is on clarity and readability of the code, not on making a reusable library that you can drop into projects.

Knowing a little bit about the strategies used by algorithms to solve tricky problems gives ideas for improvements that can be done in your own code.

Knowing more data structures than just the standard array and dictionary gives you a bigger collection of tools to build apps.

### Stack

A stack is like an array but with limited functionality. You can only push to add a new element to the top of the stack, pop to remove the element from the top, and peek at the top element without popping it off.

Why would you want to do this? Well, in many algorithms you want to add objects to a temporary list at some point and then pull them off this list again at a later time. Often the order in which you add and remove these objects matters.

A stack gives you a LIFO or last-in first-out order. The element you pushed last is the first one to come off with the next pop.

Inserting at the beginning of an array is expensive, an O(n) operation, because it requires all existing array elements to be shifted in memory. Adding at the end is O(1); it always takes the same amount of time, regardless of the size of the array.

Check out the `Stack` page on my [Data Structure playground file](/Data%20Structure.plaground) where I convert infix to postfix expression using stacks.

### Quicksort
 
Quicksort is an efficient sorting algorithm, serving as a systematic method for placing the elements of a random access file or an array in order. Developed by British computer scientist Tony Hoare in 1959 and published in 1961, it is still a commonly used algorithm for sorting. When implemented well, it can be about two or three times faster than its main competitors, merge sort and heapsort.
 
Mathematical analysis of quicksort shows that, on average, the algorithm takes O(n log n) comparisons to sort n items. In the worst case, it makes O(n2) comparisons, though this behavior is rare.

Check out the `Stack` page on my [Algorithm playground file](/Algorithm.plaground) where I sort a list of ordered item by date.

## Design Pattern

> [A Design Pattern is a named canonical form for a combination of software structures and procedures that have proven to be useful over the years.](https://blog.cleancoder.com/uncle-bob/2014/06/30/ALittleAboutPatterns.html) — Robert C. Martin
 
Design patterns are solutions to common software problems. One of the most impactful book written on software is called Design Patterns: Elements of Reusable Object-Oriented Software. It describes 23 sofware design patterns such as:
 
- Abstract Factory
- Builder
- Factory Method
- Prototype
- Singleton
- Adapter
- Bridge
- Composite
- Decorator
- Facade
- Flyweight
- Proxy
- Chain of Responsibility
- Command
- Interpreter
- Iterator
- Mediator
- Memento
- Observer
- State
- Strategy
- Template Method
- Visitor
 
Mastering the 23 software design patterns described in the book called Design Patterns: Elements of Reusable Object-Oriented Software, is so much important because it is the foundation of most of the new software design patterns.

### Visitor

[The visitor design pattern is a way of separating an algorithm from an object structure on which it operates. A practical result of this separation is the ability to add new operations to existent object structures without modifying the structures. It is one way to follow the open/closed principle.](https://en.wikipedia.org/wiki/Visitor_pattern)
 
The Visitor pattern is often maligned as too complex. In fact, it allows you to separate things that change for different reasons.

Check out the `Visitor` page on my [Design Pattern playground file](/Design%20Pattern.playground) where I implement the visitor design pattern with a concrete case that follow SOLID principles.

## Requirements

- iOS 11.0+
- Xcode 10.1+
- Swift 4.2+