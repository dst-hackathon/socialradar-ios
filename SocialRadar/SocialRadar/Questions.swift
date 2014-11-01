//
//  Questions.swift
//  SocialRadar
//
//  Created by Prakrit Tanthawatkul on 11/1/14.
//  Copyright (c) 2014 dsthackathon. All rights reserved.
//

import Foundation

class Questions {
    var id = 1
    var order = 1
    var tag = ""
    var text = ""
    var categories : [Category] = []
    
    init (id: Int, order: Int, tag: String, text: String) {
        self.id = id
        self.order = order
        self.tag = tag
        self.text = text
    }
    
    init (id: String, order: String, tag: String, text: String) {
        self.id = id.toInt()!
        self.order = order.toInt()!
        self.tag = tag
        self.text = text    }
}
