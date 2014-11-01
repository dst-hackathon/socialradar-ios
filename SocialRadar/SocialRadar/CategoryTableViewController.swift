//
//  CategorieTableTableViewController.swift
//  SocialRadar
//
//  Created by Thawee on 11/1/14.
//  Copyright (c) 2014 dsthackathon. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {

    var navigationTitle = "Category"
    
    var categories : [Category] = []
    
    var question : Questions?
    
    @IBOutlet var appsTableView : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationItem.title = self.question!.tag
        self.categories = question!.categories
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count;
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell

        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        if(self.categories.count > 0) {
            
            cell.textLabel.text = categories[indexPath.row].text
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
