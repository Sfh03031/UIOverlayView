<div align="center" >
  <img width="30%" src="image/demo.gif" />
</div>

# UIOverlayView

[![CI Status](https://img.shields.io/travis/Sfh03031/UIOverlayView.svg?style=flat)](https://travis-ci.org/Sfh03031/UIOverlayView)
[![Version](https://img.shields.io/cocoapods/v/UIOverlayView.svg?style=flat)](https://cocoapods.org/pods/UIOverlayView)
[![License](https://img.shields.io/cocoapods/l/UIOverlayView.svg?style=flat)](https://cocoapods.org/pods/UIOverlayView)
[![Platform](https://img.shields.io/cocoapods/p/UIOverlayView.svg?style=flat)](https://cocoapods.org/pods/UIOverlayView)

## Introduction
UIOverlayView is a subclass of UIView used to achieve application gray screen effect.（UIOverlayView是一个UIView的子类，用以实现应用灰屏效果。）

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

* iOS 12.0 or later
* Swift 5.9.2
* Xcode 15.1

## Installation

UIOverlayView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'UIOverlayView'
```

If you want to use the latest features of UIOverlayView use normal external source dependencies.

```ruby
pod 'UIOverlayView', :git => 'https://github.com/Sfh03031/UIOverlayView.git'
```

## Usage

First, install and import UIOverlayView
```swift

import UIOverlayView

```

Second, use class methods of UIOverlayView where you needed to show or hide

```swift

# show overlay
UIOverlayView.show()

# hide overlay
UIOverlayView.hide()

```
It's that simple, enjoy it.


UIOverlayView also provides 16 rendering modes in the form of enumeration, Like this:

```swift

public enum UIOverlayViewBlendMode: String, CaseIterable {
    case normalBlendMode     = "normalBlendMode"
    case darkenBlendMode     = "darkenBlendMode"
    case multiplyBlendMode   = "multiplyBlendMode"
    case colorBurnBlendMode  = "colorBurnBlendMode"
    case lightenBlendMode    = "lightenBlendMode"
    case screenBlendMode     = "screenBlendMode"
    case colorDodgeBlendMode = "colorDodgeBlendMode"
    case overlayBlendMode    = "overlayBlendMode"
    case softLightBlendMode  = "softLightBlendMode"
    case hardLightBlendMode  = "hardLightBlendMode"
    case differenceBlendMode = "differenceBlendMode"
    case exclusionBlendMode  = "exclusionBlendMode"
    case hueBlendMode        = "hueBlendMode"
    case saturationBlendMode = "saturationBlendMode"
    case colorBlendMode      = "colorBlendMode"
    case luminosityBlendMode = "luminosityBlendMode"
}

```

 and default mode is `saturationBlendMode`, default background color is `lightGray`, You can try to customize the effect you want with different combinations，UIOverlayView alse offers instance setting methods for rendering modes and background colors for easy customization, like this:

```swift

public extension UIOverlayView {
    
    /// set compositingFilter of layer
    /// - Parameter blendMode: case of UIOverlayViewBlendMode
    /// - Returns: Self
    func blend(mode blendMode: UIOverlayViewBlendMode) -> Self {
        self.layer.compositingFilter = blendMode.rawValue
        return self
    }
    
    /// set background color
    /// - Parameter kcolor: color
    /// - Returns: Self
    func background(color kcolor: UIColor) -> Self {
        self.backgroundColor = kcolor
        return self
    }
    
    /// add overlay
    /// - Parameter container: superView
    func overlay(in container: UIView) {
        self.frame = container.bounds
        container.addSubview(self)
    }
    
    /// remove overlay
    func remove() {
        self.removeFromSuperview()
    }
}

```

The superView of UIOverlayView defaults to `keyWindow`, but you can also customize it.

```swift

public extension UIOverlayView {
    
    /// show overlay
    /// - Parameters:
    ///   - container: superView of UIOverlayView
    ///   - mode: blendMode of UIOverlayView
    ///   - backColor: backgroundColor of UIOverlayView
    static func show(in container: UIView? = UIApplication.shared.windows.first(where: { $0.isKeyWindow }), mode: UIOverlayViewBlendMode = .saturationBlendMode, backColor: UIColor = .lightGray) {
        if let contain = container {
            if let exist = contain.subviews.first(where: { $0 is UIOverlayView }) {
                exist.removeFromSuperview()
            }
            UIOverlayView().blend(mode: mode).background(color: backColor).overlay(in: contain)
        }
    }
    
    /// hide overlay
    /// - Parameter container: superView of UIOverlayView
    static func hide(in container: UIView? = UIApplication.shared.windows.first(where: { $0.isKeyWindow })) {
        if let contain = container {
            if let exist = contain.subviews.first(where: { $0 is UIOverlayView }) {
                exist.removeFromSuperview()
            }
        }
    }
}

```

## Change log

2025.04.8, 0.1.2
- Update comments and readme(zh: 更新注释和readme)

2025.04.1, 0.1.1
- Initial version(zh: 初始版本)

## Author

Sfh03031, sfh894645252@163.com

## License

UIOverlayView is available under the MIT license. See the LICENSE file for more info.
