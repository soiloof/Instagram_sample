//
//  ViewController.swift
//  InstaSample
//
//  Created by 土屋光暉 on 2018/06/05.
//  Copyright © 2018年 mitsuki.com. All rights reserved.
//

import UIKit





class TimeLineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var timeLineTableView: UITableView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLineTableView.delegate = self
        timeLineTableView.dataSource = self
        
        let nib = UINib(nibName: "TimeLineTableViewCell", bundle: Bundle.main)
        timeLineTableView.register(nib, forCellReuseIdentifier: "Cell")
        
        timeLineTableView.tableFooterView = UIView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TimeLineTableViewCell
        cell.userNameLabel.text = "サンプル"
        return cell
        
    }
    
    
    
    


}

