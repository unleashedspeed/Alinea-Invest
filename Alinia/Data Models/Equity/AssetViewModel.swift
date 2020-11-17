//
//  AssetViewModel.swift
//  Alinia
//
//  Created by Saurabh Gupta on 17/11/20.
//  Copyright © 2020 Saurabh Gupta. All rights reserved.
//

import Foundation
import UIKit

typealias TrendingSectionsLocalization = Localization.TrendingSections

enum AssetViewModelItemType {
    case topGainers
    case topSellers
}

protocol AssetViewModelItem {
    var type: AssetViewModelItemType { get }
    var rowCount: Int { get }
    var sectionTitle: String { get }
}

extension AssetViewModelItem {
    var rowCount: Int {
        return 1
    }
}

class AssetViewModelTopGainersItem: AssetViewModelItem {
    
    var type: AssetViewModelItemType {
        return .topGainers
    }
    
    var sectionTitle: String {
        return TrendingSectionsLocalization.topGainers.localizedString
    }
    
    var rowCount: Int {
        return assets.count
    }
    
    var assets: [Asset]
    
    init(assets: [Asset]) {
        self.assets = assets
    }
    
}

class AssetViewModelTopSellersItem: AssetViewModelItem {
    
    var type: AssetViewModelItemType {
        return .topSellers
    }
    
    var sectionTitle: String {
        return TrendingSectionsLocalization.topSellers.localizedString
    }
    
    var rowCount: Int {
        return assets.count
    }
    
    var assets: [Asset]
    
    init(assets: [Asset]) {
        self.assets = assets
    }
    
}

class AssetViewModel: NSObject {
    var items = [AssetViewModelItem]()
    
    override init() {
        super.init()
        
        let topGainers: [Asset] = [Asset(name: "Medifast", listingCode: "MEDI", currentPrice: 169.62, image: AlenaImage.medifast,                             changePercentage: 50.78),
                                   Asset(name: "Pinterest", listingCode: "PINS", currentPrice: 62.32, image: AlenaImage.pinterest, changePercentage: -4.77),
                                   Asset(name: "Slack Technologies", listingCode: "WORK", currentPrice: 27.75, image: AlenaImage.slack, changePercentage: -5.99),
                                   Asset(name: "Evoqua Water", listingCode: "AQUA", currentPrice: 27.33, image: AlenaImage.evoqua, changePercentage: 5.99)]
        
        let topSellers: [Asset] = [Asset(name: "Slack Technologies", listingCode: "WORK", currentPrice: 27.75, image:                                         AlenaImage.slack, changePercentage: -5.99),
                                   Asset(name: "Evoqua Water", listingCode: "AQUA", currentPrice: 27.33, image: AlenaImage.evoqua, changePercentage: 5.99)]
        
        if !topGainers.isEmpty {
            items.append(AssetViewModelTopGainersItem(assets: topGainers))
        }
        
        if !topSellers.isEmpty {
            items.append(AssetViewModelTopSellersItem(assets: topSellers))
        }
        
    }
}

//MARK: UITableViewDataSource
extension AssetViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]
        if let cell = tableView.dequeueReusableCell(withIdentifier: TrendingTableViewCell.identifier, for: indexPath) as? TrendingTableViewCell {
            switch item.type {
            case .topGainers:
                if let item = item as? AssetViewModelTopGainersItem {
                    cell.item = item.assets[indexPath.row]
                }
            case .topSellers:
                if let item = item as? AssetViewModelTopSellersItem {
                    cell.item = item.assets[indexPath.row]
                }
            }
                                  
            return cell
        }
        
        return UITableViewCell()
    }
}

//MARK: UITableViewDelegate
extension AssetViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let customHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
        customHeaderView.backgroundColor = .white

        let label = UILabel(frame: CGRect(x: 24, y: 0, width: UIScreen.main.bounds.width, height: 64))

        label.text = items[section].sectionTitle
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        customHeaderView.addSubview(label)

        return customHeaderView
    }
}
