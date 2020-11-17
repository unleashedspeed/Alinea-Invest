//
//  TabBarController.swift
//  Alinia
//
//  Created by Saurabh Gupta on 16/11/20.
//  Copyright © 2020 Saurabh Gupta. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    lazy public var homeTabBar: HomeViewController = {
        let homeTabBar = HomeViewController()
        let defaultImage = AlenaImage.home
        let tabBarItem = UITabBarItem(title: nil, image: defaultImage, selectedImage: nil)
        homeTabBar.tabBarItem = tabBarItem
        
        return homeTabBar
    }()
    
    lazy public var exploreTabBar: ExploreViewController = {
        let exploreTabBar = ExploreViewController()
        let defaultImage = AlenaImage.explore
        let tabBarItem = UITabBarItem(title: nil, image: defaultImage, selectedImage: nil)
        exploreTabBar.tabBarItem = tabBarItem

        return exploreTabBar    
    }()
    
    lazy public var indicesTabBar: IndicesViewController = {
        let indicesTabBar = IndicesViewController()
        let defaultImage = AlenaImage.indices
        let tabBarItem = UITabBarItem(title: nil, image: defaultImage, selectedImage: nil)
        indicesTabBar.tabBarItem = tabBarItem
        
        return indicesTabBar
    }()
    
    lazy public var socialTabBar: SocialViewController = {
        let socialTabBar = SocialViewController()
        let defaultImage = AlenaImage.social
        let tabBarItem = UITabBarItem(title: nil, image: defaultImage, selectedImage: nil)
        socialTabBar.tabBarItem = tabBarItem
        
        return socialTabBar
    }()
    
    lazy public var insightsTabBar: InsightsViewController = {
        let insightsTabBar = InsightsViewController()
        let defaultImage = AlenaImage.insights
        let tabBarItem = UITabBarItem(title: nil, image: defaultImage, selectedImage: nil)
        insightsTabBar.tabBarItem = tabBarItem
        
        return insightsTabBar
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewControllers = [homeTabBar,
                           UINavigationController(rootViewController: exploreTabBar),
                           indicesTabBar,
                           socialTabBar,
                           insightsTabBar]
        tabBar.tintColor = .systemIndigo
    }
    
}
