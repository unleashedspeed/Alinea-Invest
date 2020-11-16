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
    
    typealias TrendingSectionsLocalization = Localization.TrendingSections

    enum Trending {
        case topGainers
        case topSellers
        
        var equities: [Equity] {
            switch self {
            case .topGainers:
                return Equity.topGainers
            case .topSellers:
                return Equity.topSellers
            }
        }
        
        var localizedString: String {
            switch self {
            case .topGainers:
                return TrendingSectionsLocalization.topGainers.localizedString
            case .topSellers:
                return TrendingSectionsLocalization.topSellers.localizedString
            }
        }
    }
    
    private let reuseIdentifier = "Trending"
    private let rowHeight: CGFloat = 100
    private var sections: [Trending] = [.topGainers, .topSellers]
    
    fileprivate func configureTableView() {
        tableView.register(TrendingTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = rowHeight
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }

}

//MARK: TableView's Delegate and DataSource
extension TrendingTableViewController {
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].equities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? TrendingTableViewCell else { return UITableViewCell() }
        let equity = sections[indexPath.section].equities[indexPath.row]
        cell.configure(equity: equity)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let customHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 64))
        customHeaderView.backgroundColor = .white

        let label = UILabel(frame: CGRect(x: 24, y: 0, width: view.bounds.width, height: 64))

        label.text = sections[section].localizedString
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        customHeaderView.addSubview(label)

        return customHeaderView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //PLACEHOLDER: for action when he specified row is now selected
    }
}

//MARK: IndicatorInfoProvider
extension TrendingTableViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: Localization.ExploreTabs.trending.localizedString)
    }
}
