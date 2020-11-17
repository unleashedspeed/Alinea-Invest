//
//  TrendingTableViewController.swift
//  Alinia
//
//  Created by Saurabh Gupta on 11/11/20.
//  Copyright © 2020 Saurabh Gupta. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TrendingTableViewController: UITableViewController {
    
    private let viewModel = AssetViewModel()
    private let rowHeight: CGFloat = 100
    
    fileprivate func configureTableView() {
        tableView.dataSource = viewModel
        tableView.delegate = viewModel
        tableView.register(TrendingTableViewCell.self, forCellReuseIdentifier: TrendingTableViewCell.identifier)
        tableView.rowHeight = rowHeight
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }

}

//MARK: IndicatorInfoProvider
extension TrendingTableViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: Localization.ExploreTabs.trending.localizedString)
    }
}
