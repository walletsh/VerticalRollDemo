//
//  RollDetailViewController.swift
//  VerticalRollDemo
//
//  Created by imwallet on 16/12/27.
//  Copyright © 2016年 imWallet. All rights reserved.
//

import UIKit

class RollDetailViewController: UIViewController {

    var rollTitle: String?
    var rollDesc: String? 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        print("rollTitle : \(rollTitle)")
        print("rollDesc : \(rollDesc)")
        
        let button = UIButton(type: .contactAdd)
        button.center = view.center
        button.backgroundColor = UIColor.orange
        button.addTarget(self, action: #selector(dismissAction(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        let middleText = " -- "
        let detailText = rollTitle! + middleText + rollDesc!
        
        let titleRange = NSMakeRange(0, (rollTitle?.characters.count)!)
        let middleRange = NSMakeRange((rollTitle?.characters.count)!, middleText.characters.count)
        let descRange = NSMakeRange((rollTitle?.characters.count)! + middleText.characters.count, (rollDesc?.characters.count)!)
        
        let attributeStr = NSMutableAttributedString(string: detailText)
        attributeStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.randomColor(), range: titleRange)
        attributeStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.red, range: middleRange)
        attributeStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.randomColor(), range: descRange)
        
        let detailLabel = UILabel(frame: CGRect(x: 0, y: 200, width: view.frame.size.width, height: 50))
        detailLabel.backgroundColor = UIColor.randomColor().withAlphaComponent(0.1)
//        detailLabel.text = rollTitle! + middleText + rollDesc!
        detailLabel.attributedText = attributeStr
        detailLabel.textAlignment = .center
        detailLabel.font = UIFont.systemFont(ofSize: 22, weight: 1.2)
        view.addSubview(detailLabel)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc fileprivate func dismissAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
