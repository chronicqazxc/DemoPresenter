# DemoPresenter

## Purpose
As a frameworks provider we usually need to demo our features internally before deliver to outside, is framework will help framework developers to integrate features with less code as possible so developers can focus on feature development.

## Demo
![](/.screenshots/demo.gif)

## How to use
| Step | Screenshot |
|--|--|
| 1. Prepare DestinedViewControllers.plist | ![](/.screenshots/PrepareDestinedViewControllers.png) |
| 2. Implemented DestinedViewControllers (DemoViewControllers) | ![](/.screenshots/DestinedViewController.png) |
| 3. Add destined view controllers into DestinedViewControllers.plist | ![](/.screenshots/DestinedViewControllers.png) |
| 4. Present DemoPresenterTableViewController | ![](/.screenshots/present.png) |

## DestinedViewControllers.plist
An array structure which contain sorted destination ViewController.

## Present ExampleTableViewController
Initial DemoPresenterTableViewController by ```DemoPresenterTableViewController.destinedViewController()```

## Destination ViewController
Each destination view controller must adopt protocol ```DestinedViewController```
Two functions should be implemented
1. ```func destinedViewController() -> UIViewController```
ViewController that will be presented when cell of ```DemoPresenterTableViewController``` was tapped.
2. ```func title() -> String```
Title that will be displayed on the ```DemoPresenterTableViewController```.

## How to install
| 3rd Management Tool | Script |
|--|--|
| Carthage | (In `Cartfile.private`) `github "https://github.com/chronicqazxc/DemoPresenter" 0.1.0` |
| CocoaPods ||


Auther: [Wayne Hsiao](mailto:chronicqazxc@gmail.com)
