//
//  QuestionTableViewController.swift
//  SocialRadar
//
//  Created by Prakrit Tanthawatkul on 10/31/14.
//  Copyright (c) 2014 dsthackathon. All rights reserved.
//

import UIKit

class QuestionTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate  {

    let navigationTitle = "Questions"
    var selectedRow : Int = 0
    
    var questions : [Questions] = []
    
    @IBOutlet var appsTableView : UITableView?

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
        return self.questions.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
 
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        if(self.questions.count > 0) {
            cell.textLabel.text = self.questions[indexPath.row].text
        }
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        println("You selected cell #\(indexPath.row)!")

        selectedRow = indexPath.row
        self.performSegueWithIdentifier("selectedQuestion", sender: self)
    }
    
    func getQuestion() {
        let url = NSURL(string: "http://api.radar.codedeck.com/questions")
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            println("Task Question completed")
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
                var questionsJson : Array = jsonResult
                
                self.questions.removeAll(keepCapacity: false)
                
                for questionJson in questionsJson {
                    let id = questionJson["id"] as String
                    //
                    //                    let order = questionJson["order"] as AnyObject? as? String
                    //                    let tag = questionJson["tag"] as AnyObject? as? String
                    //                    let text = questionJson["text"] as AnyObject? as? String
                    //
                    //                    let question = Questions(id: id!,order: order!,tag: tag!,text: text!)
                    //
                    //                    self.questions.append(question)
                    
                    self.getCategory(id.toInt()!)
                }
                
            })
            
        })
        
        task.resume()
    }
    
    func getCategory(questionId : Int) {
        let url = NSURL(string: "http://api.radar.codedeck.com/questions/\(questionId)")
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            println("Task Category completed")
            if(error != nil) {
                // If there is an error in the web request, print it to the console
                println(error.localizedDescription)
            }
            var err: NSError?
            
            var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as Dictionary<String, AnyObject>
            if(err != nil) {
                // If there is an error parsing JSON, print it to the console
                println("JSON Error \(err!.localizedDescription)")
            }
            //            let results: NSArray = jsonResult["results"] as NSArray
            dispatch_async(dispatch_get_main_queue(), {
                var questionJson : Dictionary<String, AnyObject> = jsonResult
                
//                self.questions.removeAll(keepCapacity: false)
                
                let id = questionJson["id"] as AnyObject? as? String
                
                let order = questionJson["order"] as AnyObject? as? String
                let tag = questionJson["tag"] as AnyObject? as? String
                let text = questionJson["text"] as AnyObject? as? String
                
                let question = Questions(id: id!,order: order!,tag: tag!,text: text!)
                
                //                let categoriesNS = questionJson["categories"] as AnyObject? as? NSArray
                
                //                let categoriesJson = categoriesNS as Array?
                
                let categoriesJson = questionJson["categories"] as NSArray
                
                for categoryJson in categoriesJson {
                    let cId = categoryJson["id"] as AnyObject? as? String
                    
                    let cOrder = categoryJson["order"] as AnyObject? as? String
                    let cText = categoryJson["text"] as AnyObject? as? String
                    
                    let category = Category(id: cId!, order: cOrder!, text: cText!)
                    
                    let optionsJson = categoryJson["options"] as NSArray
                    
                    for optionJson in optionsJson {
                        let oId = optionJson["id"] as AnyObject? as? String
                        
                        let oOrder = optionJson["order"] as AnyObject? as? String
                        let oText = optionJson["text"] as AnyObject? as? String
                        
                        let option = Option(id: cId!, order: cOrder!, text: cText!)
                        
                        category.options.append(option)
                    }
                    
                    question.categories.append(category)
                }
                
                self.questions.append(question)
                
                self.appsTableView!.reloadData()
            })
        })
        
        task.resume()
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//     Get the new view controller using [segue destinationViewController].
//     Pass the selected object to the new view controller.
        if segue.identifier == "selectedQuestion"{
            let vc : CategoryTableViewController = segue.destinationViewController as CategoryTableViewController

            vc.question = questions[selectedRow]
        }
        
    }
}