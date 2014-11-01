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
    
    init (id: Int, order: Int, tag: String, text: String) {
        self.id = id
        self.order = order
        self.tag = tag
        self.text = text
    }
}
