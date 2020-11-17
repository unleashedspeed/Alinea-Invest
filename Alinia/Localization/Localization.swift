//
//  Localization.swift
//  Alinia
//
//  Created by Saurabh Gupta on 16/11/20.
//  Copyright © 2020 Saurabh Gupta. All rights reserved.
//

struct Localization {
    private init() {}
    
    enum TabBar: String, Localizable {
        case explore = "explore_tab_bar_item"
    }
    
    enum ExploreTabs: String, Localizable {
        case themes = "themes_tab"
        case category = "category_tab"
        case trending = "trending_tab"
    }
    
    enum TrendingSections: Localizable {
        
        case topGainers
        case topSellers
        
        var key: String {
            switch self {
            case .topGainers:
                return "top_gainers_section"
            case .topSellers:
                return "top_sellers_section"
            }
        }
        
        var arguments: [CVarArg] {
            return []
        }
    }
    
    enum CategoryTypes: Localizable {
        
        case stocks
        case etfs
        case crypto
        
        var key: String {
            switch self {
            case .stocks:
                return "stocks_category"
            case .etfs:
                return "etfs_category"
            case .crypto:
                return "crypto_category"
            }
        }
        
        var arguments: [CVarArg] {
            return []
        }
    }
    
    enum ThemeTypes: String, Localizable {
        case diversityAndInclusion = "diversity_&_inclusion"
        case boldBiotech = "bold_biotech"
        case cryptoCentral = "crypto_central"
        case sheRunsIt = "she_runs_it"
        case cleanAndGreen = "clean_&_green"
        case cannabisNess = "cannabis_ness"
        case powerIt = "power_it"
        case artAndFashion =  "art_&_fashion"
        case foodieFun = "foodie_fun"
        case homeIsWhereTheHeartIs = "home_is_where_the_heart_is"
    }
}
