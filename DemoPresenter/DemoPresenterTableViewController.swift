//
//  DemoPresenterTableViewController.swift
//  DemoPresenter
//
//  Created by Wayne Hsiao on 2018/12/22.
//  Copyright © 2018 Wayne Hsiao. All rights reserved.
//

import UIKit

public protocol Routable {
    static func destinedViewController() -> UIViewController
}

public protocol CustomTitle {
    static func title() -> String
}

public typealias DestinedViewController = Routable & CustomTitle

class DemoPresenterTableViewController: UITableViewController {
    
    enum Constant {
        static let DestinedViewControllers = "DestinedViewControllers"
    }

    lazy var dataSource: [String:String] = {
        if let path = Bundle.main.path(forResource: Constant.DestinedViewControllers, ofType: "plist") {
            return NSDictionary(contentsOfFile: path) as? [String:String] ?? [:]
        } else {
            let alertController = UIAlertController(title: "Warning", message: "\(Constant.DestinedViewControllers).plist is missing", preferredStyle: .alert)
            present(alertController, animated: true, completion: nil)
            print("\(Constant.DestinedViewControllers).plist is missing")
            return [:]
        }
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadRows(at: tableView.indexPathsForVisibleRows ?? [], with: .automatic)
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.keys.count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let viewControllerString = dataSource.map {
            $0.value
            }[indexPath.row]
        
        cell.textLabel?.text = demoViewControllerFromString(viewControllerString)?.title() ?? "\(viewControllerString) doesn't implemented protocol DestinedViewController"
        
        return cell
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = dataSource.map {
            $0.value
            }[indexPath.row]
        
        if let viewController = demoViewControllerFromString(controller) {
            let destination = viewController.destinedViewController()
            if let navigation = navigationController {
                navigation.pushViewController(destination, animated: true)
            } else {
                present(destination, animated: true, completion: nil)
            }
        }
    }
    
    func demoViewControllerFromString(_ string: String) -> DestinedViewController.Type? {
        if let demoViewController = NSClassFromString(string) as? DestinedViewController.Type {
            return demoViewController
        } else {
            print("\(string) doesn't implemented protocol DestinedViewController")
            return nil
        }
    }

}

extension DemoPresenterTableViewController: Routable {
    
    public static func destinedViewController() -> UIViewController {
        let frameworkBundle = Bundle(for: DemoPresenterTableViewController.self)
        let path = frameworkBundle.path(forResource: "DemoPresenterResources", ofType: "bundle") ?? Bundle.main.path(forResource: "DemoPresenterResources", ofType: "bundle")
        
        let bundle = Bundle(path: path ?? "")
        
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let controller = storyboard.instantiateViewController(withIdentifier: "ExampleTableViewController")
        return controller
    }
}
