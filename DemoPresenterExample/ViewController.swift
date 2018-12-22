//
//  ViewController.swift
//  DemoPresenterExample
//
//  Created by Wayne Hsiao on 2018/12/22.
//  Copyright © 2018 Wayne Hsiao. All rights reserved.
//

import UIKit
import DemoPresenter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

extension ViewController: DestinedViewController {
    static func title() -> String {
        return "Demo view controller"
    }
    
    static func destinedViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "ViewController")
    }
}

