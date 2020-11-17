//
//  ThemeViewModel.swift
//  Alinia
//
//  Created by Saurabh Gupta on 17/11/20.
//  Copyright © 2020 Saurabh Gupta. All rights reserved.
//

import Foundation
import UIKit

typealias ThemeTypesLocalization = Localization.ThemeTypes

protocol ThemeViewModelItem {
    var name: String { get }
    var image: UIImage? { get }
}

extension ThemeViewModelItem {
    var image: UIImage? {
        return AlenaImage.themePlaceholder
    }
}

class ThemeViewModelStandardItem: ThemeViewModelItem {
    
    var name: String {
        return theme.name
    }
    
    var image: UIImage? {
        return theme.image
    }
    
    var theme: Theme
    
    init(theme: Theme) {
        self.theme = theme
    }
    
}

class ThemeViewModel: NSObject {
    var items = [ThemeViewModelItem]()
    
    override init() {
        super.init()

        let themes = getThemes().map({ ThemeViewModelStandardItem(theme: $0) })
        items.append(contentsOf: themes)
    }
    
    private func getThemes() -> [Theme] {
        return [Theme(name: ThemeTypesLocalization.diversityAndInclusion.localizedString, image: AlenaImage.diversityAndInclusion),
                Theme(name: ThemeTypesLocalization.boldBiotech.localizedString, image: AlenaImage.boldBiotech),
                Theme(name: ThemeTypesLocalization.cryptoCentral.localizedString, image: AlenaImage.cryptoCentral),
                Theme(name: ThemeTypesLocalization.sheRunsIt.localizedString, image: AlenaImage.sheRunsIt),
                Theme(name: ThemeTypesLocalization.cleanAndGreen.localizedString, image: AlenaImage.cleanAndGreen),
                Theme(name: ThemeTypesLocalization.cannabisNess.localizedString, image: AlenaImage.cannabisNess),
                Theme(name: ThemeTypesLocalization.powerIt.localizedString, image: AlenaImage.powerIt),
                Theme(name: ThemeTypesLocalization.foodieFun.localizedString, image: AlenaImage.foodieFun),
                Theme(name: ThemeTypesLocalization.artAndFashion.localizedString, image: AlenaImage.artAndFashion),
                Theme(name: ThemeTypesLocalization.homeIsWhereTheHeartIs.localizedString, image: AlenaImage.homeIsWhereTheHeartIs)]
    }
}

//MARK: UICollectionViewDataSource
extension ThemeViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThemeCollectionViewCell.identifier, for: indexPath) as? ThemeCollectionViewCell {
            cell.item = items[indexPath.row]
                                  
            return cell
        }
        
        return UICollectionViewCell()
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension ThemeViewModel: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
        
        return CGSize(width: size, height: size)
    }
}
