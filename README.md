
# SFBaseKit

[![Swift Version][swift-image]][swift-url] [![License][license-image]][license-url] [![Build Status](https://travis-ci.com/scalefocus/SFBaseKit.svg?branch=master)](https://travis-ci.com/scalefocus/SFBaseKit) [![CocoaPods Compatible](https://img.shields.io/cocoapods/v/SFBaseKit)](https://img.shields.io/cocoapods/v/SFBaseKit) [![Platform](https://img.shields.io/cocoapods/p/SFBaseKit)](http://cocoapods.org/pods/SFBaseKit)

SFBaseKit consists of commonly used utilities and extensions, not-contained in native iOS frameworks. 

Table of contents
=================  
* [Features](#features)
* [Requirements](#requirements)
* [Installation](#installation)
* [Usage example](#usage-example)

## Features
- [x] **Coordinators** - setup your navigation using Coordinator Pattern.
- [x] **Base Classes** - useful subclasses that implement generally used utilities.
- [x] **Extensions** - helpful extensions of UIKit components, data types and collections.

## Requirements
- iOS 10.0+
- Swift 4

## Installation
### Cocoapods
SFBaseKit is available through [CocoaPods](https://cocoapods.org/pods/SFBaseKit). 
CocoaPods is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate SFBaseKit into your Xcode project using CocoaPods, specify it in your Podfile:

```ruby
pod 'SFBaseKit', '~> 2.1.0'
```
To get the full benefits import `SFBaseKit` at the start of the source file:

```swift
import SFBaseKit
```
### Carthage

Carthage is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate SFBaseKit into your Xcode project using Carthage, specify it in your Cartfile:
```ruby
github "scalefocus/SFBaseKit" ~> 2.1.0
```
## Usage Example

### Coordinator 
Make sure to follow the steps below in order to have properly setup coordinator pattern.
First step under app target on the **General tab**. In the **Deployment Info** section, remove the entry in the **Main Interface** field. 

![Alt Text](https://media.giphy.com/media/MaUQAYDgXhFzj6Zvpo/giphy.gif)
#### Setup #1 

AppCoordinator and window should be initialized in **AppDelegate**
```swift
var window: UIWindow?
var appCoordinator: Coordinator?

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Initialize the window and the appCoordinator
        window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
        
        return true
    }
```
# OR
#### Setup #2

Initialization of window and AppCoordinator should take place in **SceneDelegate** not in AppDelegate.
```swift
var window: UIWindow?
var appCoordinator: Coordinator?

 func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        // Initialize the window and the appCoordinator
        window = UIWindow(frame: UIScreen.main.bounds)
        window.windowScene = windowScene
        
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
    }
```

In AppCoordinator the first coordinator should be initialized and added to  childCoordinators.
```swift
let loginCoordinator = LoginCoordinator(navigationController: navigationController)
addChildCoordinator(loginCoordinator)
```

In AppCoordinator start method the first coordinator should be started. 
```swift
 childCoordinators.first?.start()
```

In LoginCoordinator override start method and push or present ViewController. 
```swift
class LoginCoordinator: Coordinator {
     override func start() {
            guard let loginViewController = LoginViewController.instantiateFromStoryboard() else { return }

            loginViewController.sceneDelegate = self
            navigationController.pushViewController(loginViewController, animated: false)
        }
}
```
    
To run the example project, clone the repo, and run ***pod install*** from the Example directory first.


## License

SFBaseKit is available under the MIT license. See the LICENSE file for more info.

[swift-image]:https://img.shields.io/badge/swift-5-green.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE



