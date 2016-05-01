![Interpolate - Swift interpolation for gesture-driven animations](https://cloud.githubusercontent.com/assets/889949/14937965/8b70c90a-0f16-11e6-972a-0ffa39df3e3d.png)

[![Build Status](https://travis-ci.org/marmelroy/Interpolate.svg?branch=master)](https://travis-ci.org/marmelroy/PeekPop) [![Version](http://img.shields.io/cocoapods/v/Interpolate.svg)](http://cocoapods.org/?q=PeekPop)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

# Interpolate
Interpolate is a Swift interpolation framework for creating interactive gesture-driven animations.

<p align="center"><img src="http://i.giphy.com/l4HobBq7BD6xKKGBi.gif" width="242" height="425"/></p>

## Usage

The :key: idea  of Interpolate is -
**all animation is the interpolation of values over time.**    

To use Interpolate:

Import Interpolate at the top of your Swift file.

```swift
import Interpolate
```

Create an interpolation. Initialise an Interpolate object with a from value, a to value and an application closure.

```swift
let colorChange = Interpolate(from: UIColor.whiteColor(), to: UIColor.redColor(), apply: { [weak self] (result) in
    if let color = result as? UIColor {
      self?.view.backgroundColor = color
    }
})
```

Next, you will need to find a way to translate the gesture's progress to a percentage value (i.e. a CGFloat between 0.0 and 1.0).

Then just apply it to the Interpolate object.
```swift
colorChange.progress = percentage
```

To stop the interpolation
```swift
colorChange.stop()
```


Voila!

## What can I interpolate?

Interpolate currently supports the interpolation of:
- CGPoint
- CGRect
- CGSize
- Double
- CGFloat
- Int
- NSNumber
- UIColor

More types will be added over time.

## Advanced usage

Interpolate is not just for dull linear interpolations.

For smoother animations, consider using any of the following functions: **Linear, EaseIn, EaseOut, EaseInOut and Spring.**

```swift
// Spring interpolation
shadowPosition = Interpolate(from: -shadowView.frame.size.width, to: (self.view.bounds.size.width - shadowView.frame.size.width)/2, apply: { [weak self] (result) in
    if let originX = result as? CGFloat {
        self?.shadowView.frame.origin.x = originX
    }
}, function: SpringInterpolation(damping: 30.0, velocity: 0.0, mass: 1.0, stiffness: 100.0))

// Ease out interpolation
groundPosition = Interpolate(from: CGPointMake(0, self.view.bounds.size.height), to: CGPointMake(0, self.view.bounds.size.height - 150), apply: { [weak self] (result) in
    if let origin = result as? CGPoint {
        self?.groundView.frame.origin = origin
    }
}, function: BasicInterpolation.EaseOut)
```

In fact, you can easily create your own interpolation functions. Just create an object that conforms to the InterpolationFunction protocol.

### Setting up with [CocoaPods](http://cocoapods.org/?q=Interpolate)
```ruby
source 'https://github.com/CocoaPods/Specs.git'
pod 'Interpolate', '~> 0.1'
```

### Setting up with Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate Interpolate into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "marmelroy/Interpolate"
```
