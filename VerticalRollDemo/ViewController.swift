//
//  ViewController.swift
//  VerticalRollDemo
//
//  Created by imwallet on 16/12/27.
//  Copyright © 2016年 imWallet. All rights reserved.
//

import UIKit


class ViewController: UIViewController, VerticalRollViewDelegate {
    
    fileprivate var titleArray = Array<String>()
    fileprivate var descArray = Array<String>()
    
    fileprivate lazy var verView: VerticalRollView = {
        let rollView = VerticalRollView(frame: CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: 50), titles: self.titleArray, descs: self.descArray)
//        rollView.backgroundColor = UIColor.purple
        rollView.delegate = self
        return rollView
    }()
    
    fileprivate var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
        
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func receiveTapGecognizerAction(_ count: Int) {
        let detailVC = RollDetailViewController()
        detailVC.rollTitle = titleArray[count]
        detailVC.rollDesc = descArray[count]
        self.present(detailVC, animated: true, completion: nil)
    }
}

extension ViewController{
    
     fileprivate func setupData() {
        for index in 0..<5 {
            let title = "HOHO" + String(index)
            let desc = "IOS开发者" + String(index)
            
            titleArray.append(title)
            descArray.append(desc)
        }
    }
    
    fileprivate func setupUI() {
        
        view.addSubview(verView)
    }
}


