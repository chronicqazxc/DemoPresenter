//
//  TableViewController.swift
//  DemoPresenterExample
//
//  Created by Hsiao, Wayne on 2019/8/16.
//  Copyright © 2019 Wayne Hsiao. All rights reserved.
//

import UIKit
import DemoPresenter

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 50
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row+1)"
        return cell
    }
}

extension TableViewController: DestinedViewController {
    static func title() -> String {
        return "Demo table controller"
    }

    static func destinedViewController() -> UIViewController {
        let tableViewController = TableViewController(style: .plain)
        return tableViewController
    }
}
