//
//  UIImageUtils.swift
//  StepStation
//
//  Created by dengwz on 2017/6/14.
//  Copyright © 2017年 QuerySky. All rights reserved.
//

import UIKit

// MARK: 图片着色工具
extension UIImage {

    public func imageWithTintColor(_ tintColor: UIColor) -> UIImage {
        return self.imageWithTintColor(tintColor, CGBlendMode.destinationIn)
    }

    public func imageWithGradientTintColor(_ tintColor: UIColor) -> UIImage {
        return self.imageWithTintColor(tintColor, CGBlendMode.overlay)
    }
    
    private func imageWithTintColor(_ tintColor: UIColor,_ blendMode: CGBlendMode) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0.0)
        tintColor.setFill()
        
        let bounds = CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: self.size)
        UIRectFill(bounds)
        
        self.draw(in: bounds, blendMode: blendMode, alpha: 1.0)
        
        if blendMode != CGBlendMode.destinationIn {
            self.draw(in: bounds, blendMode: CGBlendMode.destinationIn, alpha: 1.0)
        }
        
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return tintedImage!
    }
}


