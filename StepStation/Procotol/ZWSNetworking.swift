//
//  ZWSNetworking.swift
//  UEHtml
//
//  Created by dengwz on 2017/5/22.
//  Copyright © 2017年 QuerySky. All rights reserved.
//

import UIKit
import XCGLogger
import Alamofire
import HandyJSON

class ZWSNetworking: NSObject {

    open static let shareService: ZWSNetworking = {
        return ZWSNetworking()
    }()
    
    func postRequest(_ url: String,_ functionUrl: String,parameters: Parameters? = nil) -> DataRequest {
        
        let urlString = url + functionUrl
        
        var parms:Parameters? = nil
        if parameters == nil {
            parms = Parameters()
            parms?["key"] = APP_KEY
        } else {
            parms = parameters
            parms?["key"] = APP_KEY
        }
        
        return Alamofire.request(urlString, method: .get, parameters: parms).responseString {
            response in
            //guard let JSON = response.result.value else { return } 
            LogUtils.default.debug("地址：>> \(String(describing: response.request?.url?.absoluteString))")
            LogUtils.default.debug("结果：>> \(String(describing: response.result.value))")
        }
    }
    
}








