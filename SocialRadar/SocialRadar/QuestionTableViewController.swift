//
//  QuestionTableViewController.swift
//  SocialRadar
//
//  Created by Prakrit Tanthawatkul on 10/31/14.
//  Copyright (c) 2014 dsthackathon. All rights reserved.
//

import UIKit

class QuestionTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate  {

    var items: [String] = ["We", "Heart", "B A C K TO S I G N U P"]
    let navigationTitle = "Questions"
    
    
    @IBOutlet var appsTableView : UITableView?
    var tableData = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.navigationItem.title = navigationTitle

        getQuestion()
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
        
//        cell.textLabel.text = self.items[indexPath.row]
//        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        if(self.tableData.count > 0) {
            let rowData: NSDictionary = self.tableData[indexPath.row] as NSDictionary
            
            cell.textLabel.text = rowData["text"] as? String
        }
        
        
        
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
    
    func getQuestion() {
        let url = NSURL(string: "http://api.radar.codedeck.com/questions")
//        let theRequest = NSURLRequest(URL: url!)
        
//        NSURLConnection.sendAsynchronousRequest(theRequest, queue: NSOperationQueue(), completionHandler: {(response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
//            if data.length > 0 && error == nil {
//                let response : AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil)
//                
//                let dataResponse = response as NSArray
//                
//                self.tableData = dataResponse
//                self.appsTableView!.reloadData()
//                //
//                //                self.items = dataResponse
//                
//            } else {
//                println("Connection error")
//            }
//        })
        
//        let urlPath = "http://itunes.apple.com/search?term=\(escapedSearchTerm)&media=software"
//        let url = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            println("Task completed")
            if(error != nil) {
                // If there is an error in the web request, print it to the console
                println(error.localizedDescription)
            }
            var err: NSError?
            
            var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSArray
            if(err != nil) {
                // If there is an error parsing JSON, print it to the console
                println("JSON Error \(err!.localizedDescription)")
            }
//            let results: NSArray = jsonResult["results"] as NSArray
            dispatch_async(dispatch_get_main_queue(), {
                self.tableData = jsonResult
                self.appsTableView!.reloadData()
            })
        })
        
        task.resume()
    }
}