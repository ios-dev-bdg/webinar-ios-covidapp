//
//  LocalStatusCell.swift
//  covid-webinar-app
//
//  Created by IRFAN TRIHANDOKO on 02/04/20.
//  Copyright © 2020 Muhammad Arif. All rights reserved.
//

import UIKit

class LocalStatusCell: UICollectionViewCell {
    
    @IBOutlet weak var numberLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    
    func setupData(data: [String]) {
        switch data.last {
        case "DALAM PERAWATAN":
            numberLbl.textColor = .systemOrange
            statusLbl.textColor = .systemOrange
        case "SEMBUH":
            numberLbl.textColor = .systemGreen
            statusLbl.textColor = .systemGreen
        case "MENINGGAL":
            numberLbl.textColor = .systemBlue
            statusLbl.textColor = .systemBlue
        default:
            numberLbl.textColor = .systemPurple
            statusLbl.textColor = .systemPurple
        }
        numberLbl.text = data.first
        statusLbl.text = data.last
    }
    
}
