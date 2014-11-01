//
//  SocialRadarRestAPI.swift
//  SocialRadar
//
//  Created by DSTRS TRAC Web on 10/31/2557 BE.
//  Copyright (c) 2557 dsthackathon. All rights reserved.
//

import Foundation
//import AlamoFire

class SocialRadarRestAPI: NSObject {
    func getQuestion() {        
        let url = NSURL(string: "http://api.radar.codedeck.com/questions")
        let theRequest = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(theRequest, queue: NSOperationQueue(), completionHandler: {(response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            if data.length > 0 && error == nil {
                let response : AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil)
                
                println(response)
                
//                var jsonresp:String! = response
//                
//                println(jsonresp)
                
            } else {
                println("Connection error")
            }
        })
    }
    
    func logIn() {
    
    }
    
    func submitAnswer() {
        
    }
}