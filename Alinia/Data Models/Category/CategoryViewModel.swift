//
//  CategoryViewModel.swift
//  Alinia
//
//  Created by Saurabh Gupta on 17/11/20.
//  Copyright © 2020 Saurabh Gupta. All rights reserved.
//

import Foundation
import UIKit

typealias CategoryTypesLocalization = Localization.CategoryTypes

enum CategoryViewModelItemType {
    case stocks
    case etf
    case crypto
}

protocol CategoryViewModelItem {
    var type: CategoryViewModelItemType { get }
    var name: String { get }
    var image: UIImage? { get }
    var backgroundColor: UIColor { get }
}

extension CategoryViewModelItem {
    var image: UIImage? {
        return AlenaImage.assetPlaceholder
    }
}

class CategoryViewModelStandardItem: CategoryViewModelItem {
    
    var backgroundColor: UIColor {
        switch type {
        case .stocks:
            return .systemIndigo
        case .etf:
            return .blue
        case .crypto:
            return .orange
        }
    }
    
    var name: String {
        return category.name
    }
    
    var image: UIImage? {
        return category.image?.withTintColor(.white)
    }
    
    var type: CategoryViewModelItemType
    var category: Category
    
    init(category: Category, type: CategoryViewModelItemType) {
        self.category = category
        self.type = type
    }
    
}

class CategoryViewModel: NSObject {
    var items = [CategoryViewModelItem]()
    
    override init() {
        super.init()
        
        let stocksCategoryItem = CategoryViewModelStandardItem(category: Category(name: CategoryTypesLocalization.stocks.localizedString, image: AlenaImage.stocks), type: .stocks)
        let etfsCategoryItem = CategoryViewModelStandardItem(category: Category(name: CategoryTypesLocalization.etfs.localizedString, image: AlenaImage.etf), type: .etf)
        let cryptoCategoryItem = CategoryViewModelStandardItem(category: Category(name: CategoryTypesLocalization.crypto.localizedString, image: AlenaImage.crypto), type: .crypto)

        
        items.append(contentsOf: [stocksCategoryItem, etfsCategoryItem, cryptoCategoryItem])
    }
}

//MARK: UITableViewDataSource
extension CategoryViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as? CategoryTableViewCell {
            cell.item = items[indexPath.row]
            
            return cell
        }
        
        return UITableViewCell()
    }
}
