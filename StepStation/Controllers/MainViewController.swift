//
//  MainViewController.swift
//  StepStation
//
//  Created by dengwz on 2017/6/8.
//  Copyright © 2017年 QuerySky. All rights reserved.
//

import UIKit
import SnapKit


class MainViewController: BaseViewController {
    
    typealias Item = (icon: String,title: String,bottomColor: UIColor)
    var navItems: [Item] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        makeUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: views
    lazy var bgImageView: UIImageView = {
        let imageView = UIImageView.init(image: UIImage.init(named: "A"))
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var bgVisualEffectView: UIVisualEffectView = {
        let blurEffect: UIBlurEffect = UIBlurEffect(style:.light)
        let visualView = UIVisualEffectView.init(effect: blurEffect)
        return visualView
    }()
    
    lazy var contentView: UIView = {
        let content = UIView()
        content.backgroundColor = UIColor.clear
        content.clipsToBounds = true
        content.layer.cornerRadius = 6
        content.layer.masksToBounds = true
        return content
    }()
    
    lazy var contentBgImageView: UIImageView = {
        let imageView = UIImageView.init(image: UIImage.init(named: "A"))
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        return imageView
    }()
    
    lazy var contentVisualEffectView: UIVisualEffectView = {
        let blurEffect: UIBlurEffect = UIBlurEffect(style:.light)
        let visualView = UIVisualEffectView.init(effect: blurEffect)
        return visualView
    }()
    
    lazy var contentNavView: UIView = {
        let content = UIView()
        content.backgroundColor = UIColor.clear
        content.clipsToBounds = true
        return content
    }()

    lazy var weatherCollectionView: WeatherCollectionController = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize.init(width: 210, height: CGFloat.contentHeight());
        
        let collection = WeatherCollectionController.init(collectionViewLayout: layout)
        return collection
    }()
}

extension MainViewController {

    fileprivate func makeUI( ) {
        
        view.addSubview(bgImageView)
        view.addSubview(bgVisualEffectView)
        bgVisualEffectView.contentView.addSubview(contentView)
        contentView.addSubview(contentBgImageView)
        contentView.addSubview(contentVisualEffectView)
        contentView.addSubview(contentNavView)

        bgImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        bgVisualEffectView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        let space: CGFloat = CGFloat.contentSapce()
        contentView.snp.makeConstraints { (make) in
            make.edges.equalTo(bgVisualEffectView.contentView).inset(UIEdgeInsetsMake(space, space, space, space))
        }
        
        contentBgImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        contentVisualEffectView.snp.makeConstraints { (make) in
            make.height.equalTo(CGFloat.contentHeight())
            make.left.equalTo(self.contentView).offset(0)
            make.right.equalTo(self.contentView).offset(0)
            make.bottom.equalTo(self.contentView).offset(0)
        }
        
        contentNavView.snp.makeConstraints { (make) in
            make.height.equalTo(CGFloat.navHeight())
            make.bottom.equalTo(contentVisualEffectView.snp.top).offset(0)
            make.left.equalTo(self.contentView).offset(0)
            make.right.equalTo(self.contentView).offset(0)
        }
        
        contentNavView.addGradientLayer()
        loadNavView()
        loadWeather()
    }
    
    //菜单选项
    func loadNavView( ) {
        
        navItems.append(("Sun-Icon","WEATHER",UIColor.init(red: 243.0/255, green: 191/255, blue: 72.0/255, alpha: 1)))
        navItems.append(("Sun-Icon","NEWS & EVENT",UIColor.init(red: 141.0/255, green: 152.0/255, blue: 227/255, alpha: 1)))
        navItems.append(("Sun-Icon","GALLERY",UIColor.init(red: 90.0/255, green: 203.0/255, blue: 227.0/255, alpha: 1)))
        
        var lastView: UIView?
        var index: Int = 0
        for item in navItems {
            let button = BaseEventView()
            button.icon = item.icon
            button.title = item.title
            button.bottomColor = item.bottomColor
            button.button!.tag = index
            button.tag = index+1
            contentNavView.addSubview(button)
            button.button!.addTarget(self, action: #selector(buttonAction), for: UIControlEvents.touchUpInside)
            
            button.snp.makeConstraints({ (make) in
                if(lastView != nil){
                    make.left.equalTo((lastView?.snp.right)!)
                }else{
                    make.left.equalTo(0)
                }
                make.top.equalTo(0)
                make.bottom.equalTo(0)
                make.width.equalTo(contentNavView.snp.width).multipliedBy(1.0/5.0)
            })
            
            if(index == 0){
                button.selectedState = true
            }
            
            lastView = button
            index += 1
        }
    }
    
    func loadWeather ( ) {
        self.addChildViewController(weatherCollectionView)
        contentVisualEffectView.contentView.addSubview(weatherCollectionView.view)
        weatherCollectionView.view.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    
    func buttonAction(_ sender:BaseButton) {
        for item in contentNavView.subviews {
            let view: BaseEventView = item as! BaseEventView
            view.selectedState = false
        }
        
        let eventView: BaseEventView = contentNavView.viewWithTag(sender.tag+1) as! BaseEventView
        eventView.selectedState = true
    }

}


extension UIView {
    
    fileprivate func addGradientLayer () {
        self.layoutIfNeeded()
        
        let gradientLayer = CAGradientLayer( )
        gradientLayer.bounds = self.bounds
        gradientLayer.borderWidth = 0
        
        let frame = self.bounds
        gradientLayer.frame = frame
        gradientLayer.colors = [UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.9).cgColor,UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.01).cgColor]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint.init(x: 0, y: 0)
        self.layer.insertSublayer(gradientLayer, at: 1)
    }
}






