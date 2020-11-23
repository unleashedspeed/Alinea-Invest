//
//  CategoryViewController.swift
//  Alinia
//
//  Created by Saurabh Gupta on 16/11/20.
//  Copyright © 2020 Saurabh Gupta. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {

    private let viewModel = CategoryViewModel()
    private let rowHeight: CGFloat = 120
    
    fileprivate func configureTableView() {
        tableView.dataSource = viewModel
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        tableView.rowHeight = rowHeight
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
    }

}
