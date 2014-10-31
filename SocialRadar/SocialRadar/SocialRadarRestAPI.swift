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
//    var data : NSMutableData = NSMutableData();
//    var delegate :
    
    func getQuestion() {
        
//        https://api.flickr.com/services/rest/?method=flickr.test.echo&api_key=7080b3a250ac855dcb96395939b61e57&format=json&nojsoncallback=1
        
        var parameter = ["method":"flickr.test.echo",
            "api_key":"https://api.flickr.com/services/rest/?method=flickr.test.echo&api_key=7080b3a250ac855dcb96395939b61e57&format=json&nojsoncallback=1",
            "format":"json","nojsoncallback":"1"
        ];
        
        Alamofire.request(.GET, "https://api.flickr.com/services/rest/", parameters: parameter)
            .response { (request, response, data, error) in
                println(request)
                println(response)
                println(error)
        }
        
//        var resp = AlamoFire.request(.GET, "https://api.flickr.com/services/rest/", parameters: parameter).responseJSON { (_, _, JSON, _) in
//            println(JSON)
//        }
        
//        return resp;
    }
}