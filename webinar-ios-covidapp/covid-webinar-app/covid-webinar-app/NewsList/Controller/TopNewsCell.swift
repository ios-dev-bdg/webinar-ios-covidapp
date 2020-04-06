//
//  TopNewsCell.swift
//  covid-webinar-app
//
//  Created by IRFAN TRIHANDOKO on 02/04/20.
//  Copyright © 2020 Muhammad Arif. All rights reserved.
//

import UIKit

class TopNewsCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupData(data: [String]) {
        titleLbl.text = data.first
        descLbl.text = data.last
    }

}
