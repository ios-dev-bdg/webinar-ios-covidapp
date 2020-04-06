//
//  NewsDetailVC.swift
//  covid-webinar-app
//
//  Created by IRFAN TRIHANDOKO on 03/04/20.
//  Copyright © 2020 Muhammad Arif. All rights reserved.
//

import UIKit

class NewsDetailVC: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    var newsData: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleLbl.text = newsData?.first ?? ""
        descLbl.text = newsData?.last ?? ""
        backgroundView.roundCorners(with: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius: 10)
        imageView.roundCorners(with: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius: 10)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
