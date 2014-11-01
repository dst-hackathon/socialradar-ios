//
//  QuestionTableViewController.swift
//  SocialRadar
//
//  Created by Prakrit Tanthawatkul on 10/31/14.
//  Copyright (c) 2014 dsthackathon. All rights reserved.
//

import UIKit

class QuestionTableViewController: UITableViewController {

    var items: [String] = ["We", "Heart", "B A C K TO S I G N U P"]
    let navigationTitle = "Questions"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.navigationItem.title = navigationTitle
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel.text = self.items[indexPath.row]
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        println("You selected cell #\(indexPath.row)!")
        if(indexPath.row == 2){
            self.performSegueWithIdentifier("goto_signup", sender: self)
        }
        else{
            self.performSegueWithIdentifier("selectedQuestion", sender: self)
        }
        
        
    }
}