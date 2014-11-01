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
                
                //                println(response)
                
                //                var jsonresp:String! = response
                //
                //                println(jsonresp)
                
                if let json = response as? Dictionary<String, AnyObject> {
                    if let id = json["id"] as AnyObject? as? String { // Currently in beta 5 there is a bug that forces us to cast to AnyObject? first
                        if let order = json["order"] as AnyObject? as? String {
                            if let tag = json["tag"] as AnyObject? as? String {
                                if let text = json["text"] as AnyObject? as? String {
                                    print("id: \(id.toInt()), order: \(order.toInt()), tag: \(tag), text: \(text)")
                                    //                                   let questions = Questions(id, order, tag, text)
                                }
                            }
                        }
                    }
                }
                else if let nsArrayObject = response as? NSArray{
                    
                    if let swiftArray = nsArrayObject as Array?{
                        println("swiftArray")
                        for question in swiftArray {
                            if let id = question["id"] as AnyObject? as? String { // Currently in beta 5 there is a bug that forces us to cast to AnyObject? first
                                if let order = question["order"] as AnyObject? as? String {
                                    if let tag = question["tag"] as AnyObject? as? String {
                                        if let text = question["text"] as AnyObject? as? String {
//                                            print("id: \(id.toInt()), order: \(order.toInt()), tag: \(tag), text: \(text)")
                                            let questions = Questions(id: id.toInt()!, order: order.toInt()!, tag: tag, text: text)
                                            println(questions.text)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
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