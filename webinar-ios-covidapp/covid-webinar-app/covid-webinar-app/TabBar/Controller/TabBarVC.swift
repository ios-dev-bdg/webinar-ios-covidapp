//
//  TabBarVC.swift
//  covid-webinar-app
//
//  Created by IRFAN TRIHANDOKO on 03/04/20.
//  Copyright © 2020 Muhammad Arif. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }
}

extension TabBarVC {
    
    func configureView() {
        let homeVC = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() as? HomeVC ?? UIViewController()
        let newsNav = UIStoryboard(name: "NewsList", bundle: nil).instantiateInitialViewController() as? UINavigationController ?? UINavigationController()
        let newsVC = newsNav.topViewController as? NewsListVC ?? UIViewController()
        let mapsVC = UIStoryboard(name: "MapsWebView", bundle: nil).instantiateInitialViewController() as? MapsWebViewVC ?? UIViewController()
        
        homeVC.tabBarItem = UITabBarItem(title: "Beranda", image: UIImage(named: "ic_home_gray"), tag: 0)
        homeVC.tabBarItem.isEnabled = true
        
        newsVC.tabBarItem = UITabBarItem(title: "Berita", image: UIImage(named: "ic_news_gray"), tag: 1)
        newsVC.tabBarItem.isEnabled = true
        
        mapsVC.tabBarItem = UITabBarItem(title: "Peta", image: UIImage(named: "ic_pin_gray"), tag: 2)
        mapsVC.tabBarItem.isEnabled = true
        
        let vc: [UIViewController] = [homeVC, newsNav, mapsVC]
        self.setViewControllers(vc, animated: false)
    }
    
}

