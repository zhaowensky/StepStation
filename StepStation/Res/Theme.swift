//
//  Theme.swift
//  StepStation
//
//  Created by dengwz on 2017/6/13.
//  Copyright © 2017年 QuerySky. All rights reserved.
//

import UIKit

public let kADAPTER_WIDTH: CGFloat = 768
public let kMainWidth: CGFloat = UIScreen.main.bounds.width
public let kMainHeight: CGFloat = UIScreen.main.bounds.height

extension CGFloat {
    public func kADAPTER_RATIO_HEIGHT( ) -> CGFloat {
        let value = CGFloat(ceilf(Float(kMainWidth*self / kADAPTER_WIDTH)))
        return value
    }
    
    public static func contentSapce () -> CGFloat {
        var space: CGFloat = CGFloat(90) //.kADAPTER_RATIO_HEIGHT()
        if UIDevice().model.contains("iPhone") {
            space = CGFloat(30).kADAPTER_RATIO_HEIGHT()
        }
        return space
    }
    
    public static func contentHeight () -> CGFloat {
        let space: CGFloat = (kMainHeight - 2*CGFloat.contentSapce()) / 3
        return space
    }
    
    public static func navHeight () -> CGFloat {
        if UIDevice().model.contains("iPhone") {
            return CGFloat(65).kADAPTER_RATIO_HEIGHT()
        }
        return CGFloat(65)
    }
}

extension UIFont {
    
    public static func navFont () -> UIFont {
        if UIDevice().model.contains("iPhone") {
            return UIFont.systemFont(ofSize: 13)
        }else{
            return UIFont.systemFont(ofSize: 16)
        }
    }
    
}






