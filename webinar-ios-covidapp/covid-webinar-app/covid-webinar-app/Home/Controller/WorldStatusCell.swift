//
//  WorldStatusCell.swift
//  covid-webinar-app
//
//  Created by IRFAN TRIHANDOKO on 02/04/20.
//  Copyright © 2020 Muhammad Arif. All rights reserved.
//

import UIKit

class WorldStatusCell: UICollectionViewCell {
    
    @IBOutlet weak var numberVw: UIView!
    @IBOutlet weak var numberLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    
    func setupData(data: [String]) {
        switch data.last {
        case "SEMBUH":
            numberVw.backgroundColor = .systemGreen
            statusLbl.textColor = .systemGreen
        case "MENINGGAL":
            numberVw.backgroundColor = .systemBlue
            statusLbl.textColor = .systemBlue
        default:
            numberVw.backgroundColor = .systemPurple
            statusLbl.textColor = .systemPurple
        }
        numberLbl.text = data.first
        statusLbl.text = data.last
    }
    
}
