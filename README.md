# WrappedValue

[![CI Status](https://img.shields.io/travis/cmtrounce/WrappedValue.svg?style=flat)](https://travis-ci.org/cmtrounce/WrappedValue)
[![Version](https://img.shields.io/cocoapods/v/WrappedValue.svg?style=flat)](https://cocoapods.org/pods/WrappedValue)
[![License](https://img.shields.io/cocoapods/l/WrappedValue.svg?style=flat)](https://cocoapods.org/pods/WrappedValue)
[![Platform](https://img.shields.io/cocoapods/p/WrappedValue.svg?style=flat)](https://cocoapods.org/pods/WrappedValue)

## Intro

Forget the struggle of having to manually parse Strings to Ints, Doubles and other data types!

Using the power of generics, WrappedValue will automatically decode them for you, with some life-changing error handling.

## Basic Usage

```swift

typealias WrappedInt = WrappedValue<Int>

struct Person {
  let age: WrappedInt
  let name: String
}
```

If your JSON API returns age as `String`  "30",  `WrappedValue` will handle the parsing of it to an `Int` as specified in the `typealias`

Access the `Int` through  `person.age.value`. 



`WrappedValue` also conforms to `Hashable`,  `Equatable` and `Numeric` 

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

WrappedValue is compiled using Swift 4.2 in Xcode 10.

## Installation

WrappedValue is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'WrappedValue'
```

## Author

cmtrounce, ctrounce94@gmail.com

## License

WrappedValue is available under the MIT license. See the LICENSE file for more info.
