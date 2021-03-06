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
    
    var selectedRow : Int = 0
    
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
        self.categories = self.question!.categories
        
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
            
            cell.textLabel.text = self.categories[indexPath.row].text
            println("cell \(indexPath.row), text \(cell.textLabel.text)")
        }
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        println("You selected category row #\(indexPath.row)!")
        
        selectedRow = indexPath.row
        self.performSegueWithIdentifier("selectedCategory", sender: self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "selectedCategory"{
            let vc : OptionTableViewController = segue.destinationViewController as OptionTableViewController
            
            vc.category = self.categories[selectedRow]
        }
    }
    

}
