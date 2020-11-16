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

    typealias CategoryTypesLocalization = Localization.CategoryTypes
    
    enum Category {
        case stocks
        case etf
        case crypto
        
        var image: UIImage? {
            switch self {
            case .stocks:
                return AlenaImage.stocks?.withTintColor(.white)
            case .etf:
                return AlenaImage.etf?.withTintColor(.white)
            case .crypto:
                return AlenaImage.crypto?.withTintColor(.white)
            }
        }
        
        var backgroundColor: UIColor {
            switch self {
            case .stocks:
                return .systemIndigo
            case .etf:
                return .blue
            case .crypto:
                return .orange
            }
        }
        
        var localizedString: String {
            switch self {
            case .stocks:
                return CategoryTypesLocalization.stocks.localizedString
            case .etf:
                return CategoryTypesLocalization.etfs.localizedString
            case .crypto:
                return CategoryTypesLocalization.crypto.localizedString
            }
        }
    }
    
    private let reuseIdentifier = "Category"
    private let rowHeight: CGFloat = 120
    private let categories: [Category] = [.stocks, .etf, .crypto]
    
    fileprivate func configureTableView() {
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = rowHeight
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
    }

}

//MARK: TableView's Delegate and DataSource
extension CategoryTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CategoryTableViewCell else { return UITableViewCell() }
        let category = categories[indexPath.row]
        cell.configure(category: category)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //PLACEHOLDER: for action when he specified row is now selected
    }
}

//MARK: IndicatorInfoProvider
extension CategoryTableViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: Localization.ExploreTabs.category.localizedString)
    }
}
