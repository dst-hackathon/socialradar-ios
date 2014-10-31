//
//  SocialRadarRestAPI.swift
//  SocialRadar
//
//  Created by DSTRS TRAC Web on 10/31/2557 BE.
//  Copyright (c) 2557 dsthackathon. All rights reserved.
//

import Foundation
import AlamoFire

class SocialRadarRestAPI: NSObject {
    
    func getQuestion() {
//        var questionJSON : String;
        
        var request2 = Alamofire.request(.GET, "http://api.radar.codedeck.com/questions").responseJSON {
            (_,_,json,_) in
             println(json)
        }
        
//        return questionJSON;
    }
    
    func logIn() {
    
    }
    
    func submitAnswer() {
        
    }
}