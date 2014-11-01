//
//  PageContentViewController.swift
//  SocialRadar
//
//  Created by Prakrit Tanthawatkul on 11/1/14.
//  Copyright (c) 2014 dsthackathon. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var link: UIPageControl!
    
    var itemIndex = 0
    var usertext = "a"
    var emailtext = "test"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.username.text = usertext
        self.email.text = emailtext
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
