//
//  ExploreViewController.swift
//  Alinia
//
//  Created by Saurabh Gupta on 16/11/20.
//  Copyright © 2020 Saurabh Gupta. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ExploreViewController: ButtonBarPagerTabStripViewController {

    let containerScrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let topBarView: ButtonBarView = {
        let view = ButtonBarView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    fileprivate func setupNavigationTitleView() {
        typealias TabBarLocalization = Localization.TabBar

        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        titleView.backgroundColor = .white
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        
        label.text = TabBarLocalization.explore.localizedString
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        titleView.addSubview(label)
        
        navigationItem.titleView = titleView
    }
    
    fileprivate func setupNavigationBar() {
        setupNavigationTitleView()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: AlenaImage.menu?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(menuTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: AlenaImage.notification?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(notificationsTapped))
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        navigationController?.navigationBar.isTranslucent = false
    }
    
    override func viewDidLoad() {
        setupSlidingTab()
        
        super.viewDidLoad()

        setupNavigationBar()

    }
    
    @objc func menuTapped() {
        //PLACEHOLDER: for action when menu is tapped
    }
    
    @objc func notificationsTapped() {
        //PLACEHOLDER: for action when notifications button is tapped
    }
    
    // MARK: - PagerTabStrip View Setup
    private func setupSlidingTab(){
        containerView = containerScrollView
        buttonBarView = topBarView
        
        self.view.addSubview(topBarView)
        self.view.addSubview(containerScrollView)
        
        NSLayoutConstraint.activate([
            self.topBarView.heightAnchor.constraint(equalToConstant: 44),
            self.topBarView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            self.topBarView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            self.topBarView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            self.containerScrollView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            self.containerScrollView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            self.containerScrollView.topAnchor.constraint(equalTo: self.topBarView.bottomAnchor, constant: 0),
            self.containerScrollView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = .systemIndigo
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .black
            newCell?.label.textColor = .systemIndigo
        }
        settings.style.selectedBarHeight = 5
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
    }

    // MARK: - PagerTabStripDataSource
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let categoryTableViewController = CategoryTableViewController()
        let themesCollectionViewController = ThemesCollectionViewController()
        let trendingTableViewController = TrendingTableViewController()
        
        return [categoryTableViewController, themesCollectionViewController, trendingTableViewController]
    }

}
