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
    
    var tableData = []
    
    var questionId : Int = 0
    
    @IBOutlet var appsTableView : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationItem.title = navigationTitle
        
        getCategory()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count;
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell

        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        if(self.tableData.count > 0) {
            let rowData: NSDictionary = self.tableData[indexPath.row] as NSDictionary
            
            cell.textLabel.text = rowData["text"] as? String
        }
        
        return cell
    }
    
    func getCategory() {
        let urlPath : String = "http://api.radar.codedeck.com/questions/\(questionId)"
        let url = NSURL(string: urlPath )
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            println("Task completed")
            if(error != nil) {
                // If there is an error in the web request, print it to the console
                println(error.localizedDescription)
            }
            var err: NSError?
            
            let jsonResult : AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err)!
            if(err != nil) {
                // If there is an error parsing JSON, print it to the console
                println("JSON Error \(err!.localizedDescription)")
            }
            //            let results: NSArray = jsonResult["results"] as NSArray
            dispatch_async(dispatch_get_main_queue(), {
                let result = jsonResult as NSDictionary
                self.tableData = result["categories"] as NSArray
                self.appsTableView!.reloadData()
            })
        })
        
        task.resume()
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
