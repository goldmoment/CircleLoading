# CircleLoading

[![CI Status](http://img.shields.io/travis/goldmoment/CircleLoading.svg?style=flat)](https://travis-ci.org/goldmoment/CircleLoading)
[![Version](https://img.shields.io/cocoapods/v/CircleLoading.svg?style=flat)](http://cocoapods.org/pods/CircleLoading)
[![License](https://img.shields.io/cocoapods/l/CircleLoading.svg?style=flat)](http://cocoapods.org/pods/CircleLoading)
[![Platform](https://img.shields.io/cocoapods/p/CircleLoading.svg?style=flat)](http://cocoapods.org/pods/CircleLoading)

## Example
![alt tag](https://github.com/goldmoment/CircleLoading/blob/master/loading1.gif)
![alt tag](https://github.com/goldmoment/CircleLoading/blob/master/loading2.gif)
![alt tag](https://github.com/goldmoment/CircleLoading/blob/master/loading3.png)

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

Xcode 8, Swift 3

## Installation

CircleLoading is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "CircleLoading"
```

## Usage

```swift
// Set colors
circleLoading.colors(color1: UIColor.red, color2: UIColor.red, color3: UIColor.red)

// Set duration
circleLoading.duration = 5.0

// Start animation
circleLoading.start()

// Pause animation
circleLoading.pause()

// Resume animation
circleLoading.resume()

// Stop animation and hide layers
circleLoading.stop()
```

## Author

goldmoment, nguyenvanvienqn@gmail.com

## License

CircleLoading is available under the MIT license. See the LICENSE file for more info.
