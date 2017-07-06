//
//  WeatherCollectionCell.swift
//  StepStation
//
//  Created by dengwz on 2017/6/22.
//  Copyright © 2017年 QuerySky. All rights reserved.
//

import UIKit

class WeatherCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var labWeather: UILabel!
    @IBOutlet weak var labDate: UILabel!
    @IBOutlet weak var iconWeather: UIImageView!
    @IBOutlet weak var labWeat: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.labDate.layer.masksToBounds = true
        self.labDate.layer.cornerRadius = 22.0/2
    }

}
