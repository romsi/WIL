# WIL

[![Swift: >= 3.0](https://img.shields.io/badge/swift-%3E%3D%203.0-orange.svg)](https://medium.com/search?q=Romain%20Asnar%20swift)
[![Twitter: @romsi94](https://img.shields.io/badge/twitter-@romsi94-blue.svg)](https://twitter.com/romsi94)

Stay ahead of the best programming practices.

- [Installation](#installation)
- [iOS](#ios)
	- [Language Features](#language-features)
		- [Swift 4.2](#swift-4.2)
	- [Prototyping](#prototyping)
		- [Xcode Playgrounds](#xcode-playgrounds)
	
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

#### Xcode Playgrounds

[Interactive playgrounds (or Xcode playgrounds) help you to quickly prototype and build your applications, and simply provide another great way to interact with your code.](https://developer.apple.com/swift/blog/?id=35)

Recently during the WWDC 2018, [Apple team presents major advancements in Xcode playgrounds](https://developer.apple.com/videos/play/wwdc2018/402/). Learn advanced tips and techniques, hear about new and often overlooked workflows, and rediscover the tools provided when coding in playgrounds.

I personally use it to enforce my understanding of a specific business requirement by quickly doing a demo to the product owner. It is fully isolated from my production code and I can import my production code to quickly improve the experience.

Trying out new frameworks, SDKs and architecture with Xcode Plagrounds become much more easier as well. I'm also using it to build spikes and stabilize it later. Unfortunately, using storyboards in playrgounds is a bit difficult.

Checkout my [Playground.playground](/Swift.playground) file and my [Medium article about adding storyboards in Xcode playgrounds](https://medium.com/@romsi94/storyboards-in-xcode-playgrounds-are-a-pain-in-the-a-343c7b3bab0c).

*Note: Run `make` to compile storyboards before running the playground*

## Requirements

- iOS 11.0+
- Xcode 10.1+
- Swift 4.2+