//
//  Equity.swift
//  Alinia
//
//  Created by Saurabh Gupta on 16/11/20.
//  Copyright © 2020 Saurabh Gupta. All rights reserved.
//

import UIKit

struct Equity {
    var name: String
    var listingCode: String
    var currentPrice: Double
    var image: UIImage?
    var changePercentage: Double
    
    static let topGainers: [Equity] = [Equity(name: "Medifast", listingCode: "MEDI", currentPrice: 169.62, image: AlenaImage.medifast, changePercentage: 50.78),
                                       Equity(name: "Pinterest", listingCode: "PINS", currentPrice: 62.32, image: AlenaImage.pinterest, changePercentage: -4.77),
                                       Equity(name: "Slack Technologies", listingCode: "WORK", currentPrice: 27.75, image: AlenaImage.slack, changePercentage: -5.99),
                                       Equity(name: "Evoqua Water", listingCode: "AQUA", currentPrice: 27.33, image: AlenaImage.evoqua, changePercentage: 5.99)]
    static let topSellers: [Equity] = [Equity(name: "Slack Technologies", listingCode: "WORK", currentPrice: 27.75, image: AlenaImage.slack, changePercentage: -5.99),
                                       Equity(name: "Evoqua Water", listingCode: "AQUA", currentPrice: 27.33, image: AlenaImage.evoqua, changePercentage: 5.99)]
}

struct AlenaImage {
    
    //MARK: TabBar Items
    static var home = UIImage(named: "home.png")
    static var explore = UIImage(named: "explore.png")
    static var indices = UIImage(named: "indices.png")
    static var social = UIImage(named: "social.png")
    static var insights = UIImage(named: "insights.png")
    
    //MARK: Navigation Items
    static var menu = UIImage(named: "menu.png")
    static var notification = UIImage(named: "notification.png")
    
    //MARK: Equities
    static var medifast = UIImage(named: "medifast.png")
    static var pinterest = UIImage(named: "pinterest.png")
    static var slack = UIImage(named: "slack.png")
    static var evoqua = UIImage(named: "evoqua.png")
    static var equityPlaceholder = UIImage(named: "equity_placeholder.png")
    
    //MARK: Category Items
    static var stocks = UIImage(named: "stocks.png")
    static var etf = UIImage(named: "etf.png")
    static var crypto = UIImage(named: "crypto.png")
}
