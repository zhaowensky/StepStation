//
//  HeWeatherModel.swift
//  UEHtml
//
//  Created by dengwz on 2017/6/7.
//  Copyright © 2017年 QuerySky. All rights reserved.
//

import UIKit
import HandyJSON


class HeWeatherModel: HandyJSON {
    var HeWeather5: Array<HeWeatherList>? = nil
    
    required init() { }
}


class HeWeatherList: HandyJSON {

    var basic: BasicModel? = nil
    var now: NowModel? = nil
    var status: String? = nil
    
    required init() { }
}


//MARK: BasicModel
class NowModel: HandyJSON {
    var fl: String? = nil
    var hum: String? = nil
    var pcpn: String? = nil
    var pres: String? = nil
    var tmp: String? = nil
    var vis: String? = nil
    var wind: WindModel? = nil
    var cond: CondModel? = nil
    
    required init() { }
}

class WindModel: HandyJSON {
    var deg: String? = nil
    var dir: String? = nil
    var sc: String? = nil
    var spd: String? = nil
    
    required init() { }
}

class CondModel: HandyJSON {
    var code: String? = nil
    var txt: String? = nil
    
    required init() { }
}


//MARK: BasicModel
class BasicModel: HandyJSON {
    
    var city: String? = nil
    var cnty: String? = nil
    var id: String? = nil
    var lat: String? = nil
    var lon: String? = nil
    
    var update: UpdateModel? = nil
    
    required init() { }
}

class UpdateModel: HandyJSON {
    
    var loc: String? = nil
    var utc: String? = nil
    
    required init() { }
}







