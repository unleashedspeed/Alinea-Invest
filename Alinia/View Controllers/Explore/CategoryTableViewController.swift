//
//  CategoryViewController.swift
//  Alinia
//
//  Created by Saurabh Gupta on 16/11/20.
//  Copyright © 2020 Saurabh Gupta. All rights reserved.
//

import UIKit
import XLPagerTabStrip

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

//MARK: IndicatorInfoProvider
extension CategoryTableViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: Localization.ExploreTabs.category.localizedString)
    }
}
