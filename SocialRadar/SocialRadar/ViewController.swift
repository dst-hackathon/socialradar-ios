//
//  ViewController.swift
//  SocialRadar
//
//  Created by Thawee on 10/31/14.
//  Copyright (c) 2014 dsthackathon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var s = SocialRadarRestAPI();
        
        s.getQuestion();
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

