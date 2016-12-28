//
//  VerticalRollView.swift
//  VerticalRollDemo
//
//  Created by imwallet on 16/12/27.
//  Copyright © 2016年 imWallet. All rights reserved.
//

import UIKit

class VerticalRollView: UIView {
    
    fileprivate var timer: Timer!
    fileprivate var count: Int = 0

    fileprivate lazy var titleLabel: UILabel = {
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.size.width * 0.4, height: self.frame.size.height))
        title.textAlignment = .center
        title.textColor = UIColor.orange
        title.font = UIFont.systemFont(ofSize: 22, weight: 1.5)
        return title
    }()
    
    fileprivate lazy var descriptionLabel: UILabel = {
        let descLabel = UILabel(frame: CGRect(x: self.titleLabel.frame.maxX, y: 0, width: self.frame.size.width * 0.6, height: self.frame.size.height))
        descLabel.textColor = UIColor.lightGray
        descLabel.font = UIFont.systemFont(ofSize: 22)
        return descLabel
        }()
    
    let titles: Array<String>
    let descs: Array<String>

    weak var delegate: VerticalRollViewDelegate?
    
    init(frame: CGRect, titles:Array<String>, descs:Array<String>) {
        
        self.titles = titles
        self.descs = descs
        super.init(frame: frame)
        
        setupUI()
        
        startAnitamion()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension VerticalRollView{
    
    fileprivate func setupUI() {
        titleLabel.text = titles[count]
        descriptionLabel.text = descs[count]
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        
        let tapGecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGecognizerAction))
        self.addGestureRecognizer(tapGecognizer)
    }
    
    @objc fileprivate func tapGecognizerAction() {
        print("tapGecognizerAction count is \(count)")
        delegate?.receiveTapGecognizerAction(count)
    }
}

protocol VerticalRollViewDelegate: NSObjectProtocol {
    
    func receiveTapGecognizerAction(_ count: Int)
}

extension VerticalRollView{
    
    fileprivate func startAnitamion() {
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 0.2
            self.exchangeSubview(at: 1, withSubviewAt: 0)
            self.alpha = 1
            
        }) { (finished) in
            
            if #available(iOS 10.0, *){
                self.timer = Timer(timeInterval: 3, repeats: true, block: { (timer) in
                    self.updateAnitamion(timer)
                })
            }else{
                self.timer = Timer(timeInterval: 3, target: self, selector: #selector(self.updateAnitamion(_:)), userInfo: nil, repeats: true)
            }
            RunLoop.main.add(self.timer, forMode: RunLoopMode.commonModes)
        }
    }
    
    @objc fileprivate func updateAnitamion(_ timer: Timer) {
        self.count += 1
        if self.count >= self.titles.count{
            self.count = 0
        }
        
        let animation = CATransition()
        animation.duration = 0.5
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = true
        animation.type = "cube"
        self.layer.add(animation, forKey: "kCAFillModeForwards")
        
        self.titleLabel.text = self.titles[self.count]
        self.descriptionLabel.text = self.descs[self.count]
        
        //                self.backgroundColor = UIColor.randomColor()
    }
}

