//
//  BaseEventView.swift
//  StepStation
//
//  Created by dengwz on 2017/6/12.
//  Copyright © 2017年 QuerySky. All rights reserved.
//

import UIKit
import SnapKit

class BaseEventView: UIControl {
    
    private var _icon: String?
    private var _title: String?
    private var _selectedState: Bool = false
    private var _bottomColor: UIColor?
    
    open var icon: String {
        get{
            return _icon!
        }
        set(iconName){
            _icon = iconName
            let iconImage = UIImage.init(named: iconName)
            self.button?.setImage(iconImage?.imageWithTintColor(UIColor.lightGray), for: UIControlState.normal)
            self.button?.setImage(iconImage?.imageWithTintColor(UIColor.white), for: UIControlState.selected)
        }
    }
    
    open var title: String {
        get{
            return _title!
        }
        set(titleName){
            _title = titleName
            button?.setTitle(" \(_title!)", for: UIControlState.normal)
            self.button?.setTitleColor(UIColor.white, for: UIControlState.selected)
            self.button?.setTitleColor(UIColor.gray, for: UIControlState.normal)
        }
    }
    
    open var selectedState: Bool {
        get{
            return _selectedState
        }
        set(status){
            _selectedState = status
            self.button?.isSelected = status
        }
    }
    
    open var bottomColor: UIColor {
        get{
            return _bottomColor!
        }
        set(color){
            _bottomColor = color
            self.bottom?.backgroundColor = _bottomColor
        }
    }
    
    open var button: BaseButton?
    open var bottom: UIView?

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    func loadView( ) {
        button = BaseButton()
        button?.titleLabel?.font = UIFont.navFont()
        self.addSubview(button!)
        button?.snp.makeConstraints({ (make) in
            make.edges.equalTo(0)
        })
        
        bottom = UIView()
        self.addSubview(bottom!)
        bottom?.snp.makeConstraints({ (make) in
            make.bottom.equalTo(self.snp.bottom)
            make.height.equalTo(5)
            make.left.equalTo(0)
            make.right.equalTo(0)
        })
    }
    
}







