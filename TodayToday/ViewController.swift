//
//  ViewController.swift
//  TodayToday
//
//  Created by Tuski on 2018/3/8.
//  Copyright © 2018年 Tuski. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    private let model = CoreDataModel()
    private var nums = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nums = model.getNumers()
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nums.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(nums[indexPath.row])
        return cell
    }
    
    
    
    
    
    @IBAction func addNum(_ sender: UIBarButtonItem) {
        let rand = Int(arc4random_uniform(1000))
        nums.append(rand)
        model.addNew(number: rand)
        tableView.reloadData()
    }
    
}

