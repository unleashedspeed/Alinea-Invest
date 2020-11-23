//
//  ExploreViewController.swift
//  Alinia
//
//  Created by Saurabh Gupta on 16/11/20.
//  Copyright © 2020 Saurabh Gupta. All rights reserved.
//

import UIKit

typealias TabBarLocalization = Localization.TabBar
typealias ExploreTabsLocalization = Localization.ExploreTabs

class ExploreViewController: UIViewController {

    enum TabIndex : Int {
        case categoryTab = 0, themesTab, trendingTab
    }
    
    private var segmentedControl: SegmentedControl!
    private var pageController: UIPageViewController!
    private var viewControllers: [UIViewController] = []
    private var currentPage: TabIndex = .categoryTab
    
    lazy var categoryTab: CategoryTableViewController = {
        var viewController = CategoryTableViewController()
        
        return viewController
    }()
    
    lazy var themesTab: ThemesCollectionViewController = {
        var viewController = ThemesCollectionViewController()
        
        return viewController
    }()
    
    lazy var trendingTab: TrendingTableViewController = {
        var viewController = TrendingTableViewController()
        
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [categoryTab, themesTab, trendingTab]
        
        setupNavigationBar()
        setupSegmentedControl()
        setupPageViewController()
    }
    
    fileprivate func setupNavigationBar() {
        setupNavigationTitleView()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: AlenaImage.menu?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(menuTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: AlenaImage.notification?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(notificationsTapped))
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        navigationController?.navigationBar.isTranslucent = false
    }
    
    fileprivate func setupNavigationTitleView() {
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        titleView.backgroundColor = .white
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        label.text = TabBarLocalization.explore.localizedString
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        titleView.addSubview(label)
        
        navigationItem.titleView = titleView
    }
    
    //MARK: - Setup SegmentedControl
    fileprivate func setupSegmentedControl() {
        segmentedControl = SegmentedControl(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        segmentedControl.backgroundColor = .white
        segmentedControl.titles = [ExploreTabsLocalization.category.localizedString, ExploreTabsLocalization.themes.localizedString, ExploreTabsLocalization.trending.localizedString]
        segmentedControl.addTarget(self, action: #selector(onChangeOfSegment(_:)), for: .valueChanged)
        view.addSubview(segmentedControl)
    }
    
    //MARK: - Setup Pagination
    private func setupPageViewController() {
        pageController = UIPageViewController.init(transitionStyle: .scroll, navigationOrientation: UIPageViewController.NavigationOrientation.horizontal, options: nil)
        pageController.view.backgroundColor = .clear
        pageController.delegate = self
        pageController.dataSource = self
        pageController.setViewControllers([categoryTab], direction: .forward, animated: false, completion: nil)
        addChild(pageController)
        view.addSubview(pageController.view)
        pageController.didMove(toParent: self)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.pageController.view.frame = CGRect(x: 0, y: self.segmentedControl.frame.maxY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
    }
    
    fileprivate func indexof(_ viewController: UIViewController) -> Int {
        return viewControllers.firstIndex(of: viewController) ?? -1
    }
    
    // Changes the currentPage to selectedSegment and direction to switch tab
    @objc func onChangeOfSegment(_ sender: SegmentedControl) {
        let selectedTab = TabIndex(rawValue: sender.selectedSegmentIndex)
        switch selectedTab {
        case .categoryTab:
            pageController.setViewControllers([viewControllers[sender.selectedSegmentIndex]], direction: .reverse, animated: true, completion: nil)
            currentPage = .categoryTab
        case .themesTab:
            if currentPage.rawValue > 1 {
                pageController.setViewControllers([viewControllers[sender.selectedSegmentIndex]], direction: .reverse, animated: true, completion: nil)
            } else {
                pageController.setViewControllers([viewControllers[sender.selectedSegmentIndex]], direction: .forward, animated: true, completion: nil)
            }
            currentPage = .themesTab
        case .trendingTab:
            if currentPage.rawValue < 2 {
                pageController.setViewControllers([viewControllers[sender.selectedSegmentIndex]], direction: .forward, animated: true, completion: nil)
            } else {
                pageController.setViewControllers([viewControllers[sender.selectedSegmentIndex]], direction: .reverse, animated: true, completion: nil)
            }
            currentPage = .trendingTab
        default:
            break
        }
    }
    
    @objc func menuTapped() {
        //PLACEHOLDER: for action when menu is tapped
    }
    
    @objc func notificationsTapped() {
        //PLACEHOLDER: for action when notifications button is tapped
    }

}

//MARK: - Pagination Delegate Methods
extension ExploreViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = indexof(viewController)
        if index != -1 {
            index = index - 1
        }
        
        if index < 0 {
            return nil
        } else {
            return viewControllers[index]
        }
    }
        
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = indexof(viewController)
        if index != -1 {
            index = index + 1
        }
        
        if index >= viewControllers.count {
            return nil
        } else {
            return viewControllers[index]
        }
    }

    func pageViewController(_ pageViewController1: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed, let lastViewController = pageViewController1.viewControllers?.last {
            let index = indexof(lastViewController)
            currentPage = TabIndex(rawValue: index) ?? .categoryTab
            self.segmentedControl.updateSegmentedControlSegment(with: index)
        }
    }
}
