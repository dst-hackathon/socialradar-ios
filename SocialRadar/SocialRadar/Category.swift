//
//  Category.swift
//  SocialRadar
//
//  Created by DSTRS TRAC Web on 11/1/14.
//  Copyright (c) 2014 dsthackathon. All rights reserved.
//

import Foundation

class Category {
    var id = 1
    var order = 1
    var text = ""
    var options : [Option] = []
    
    init (id: Int, order: Int, text: String) {
        self.id = id
        self.order = order
        self.text = text
    }
    
    init (id: String, order: String, text: String) {
        self.id = id.toInt()!
        self.order = order.toInt()!
        self.text = text
    }
}