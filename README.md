# DemoPresenter

## Purpose
Intend to help standalone demo app implementation more quickly as well as easly.

## How to use
1. Prepare DestinedViewControllers.plist
2. Implemented DestinedViewControllers (DemoViewControllers)
3. Add destined view controllers into DestinedViewControllers.plist
4. Present DemoPresenterTableViewController

## DestinedViewControllers.plist
A dictionary structure, key as discription and value as destination ViewController
e.g.: key: Demo ViewController, value: ```DemoPresenterExample.ViewController```

## Present ExampleTableViewController
Initial DemoPresenterTableViewController by ```DemoPresenterTableViewController.destinedViewController()```

## Destination ViewController
Each destination view controller must adopt protocol ```DestinedViewController```
Two functions should be implemented
1. ```func destinedViewController() -> UIViewController```
ViewController that will be presented when cell of ```DemoPresenterTableViewController``` was tapped.
2. ```func title() -> String```
Title that will be displayed on the ```DemoPresenterTableViewController```.


Auther: [chronicqazxc](chronicqazxc@gmail.com)
