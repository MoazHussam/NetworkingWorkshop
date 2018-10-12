//
//  TimeLineTableViewController.swift
//  NetworkingWorkshop
//
//  Created by Moaz Ahmed on 10/12/18.
//  Copyright © 2018 Moaz. All rights reserved.
//

import UIKit

class TimeLineTableViewController: UITableViewController {
    
    let dataController = TimeLineDataController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerCellClass(UITableViewCell.self)
        dataController.fetchData() { [weak self] in
            DispatchQueue.main.sync {
                self?.tableView.reloadData()
            }
        }

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataController.timelines?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "UITableViewCell") // Had to instatiate a new one becasue dequequed cell had the detailTextLabel always nil
        let timeline = dataController.timelines?[indexPath.row]
        cell.textLabel?.text = timeline?.user
        cell.detailTextLabel?.text = timeline?.date
        return cell
    }

}
