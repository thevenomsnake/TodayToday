//
//  TodayViewController.swift
//  today123
//
//  Created by 涂舒舰 on 2018/3/8.
//  Copyright © 2018年 涂舒舰. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var num: UILabel!
    private let model = CoreDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nums = model.getNumers()
        if let last = nums.last {
            num.text = String(last)
        }
    }
    
 
    
    @IBAction func aadNumer() {
        let rand = Int(arc4random_uniform(1000))
        num.text = String(rand)
        model.addNew(number: rand)
    }

}
