//
//  OptionTableViewController.swift
//  SocialRadar
//
//  Created by Thawee on 11/1/14.
//  Copyright (c) 2014 dsthackathon. All rights reserved.
//

import UIKit

class OptionTableViewController: UITableViewController {

    var navigationTitle = "Option"
    
    var options : [Option] = []
    
    var category : Category?
    
    @IBOutlet var appsTableView : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationItem.title = self.category!.text
        self.options = category!.options
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.options.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        if(self.options.count > 0) {
            
            cell.textLabel.text = options[indexPath.row].text
            println("cell \(indexPath.row), text \(cell.textLabel.text)")
        }
        
        return cell
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
}
