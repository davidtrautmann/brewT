//
//  SettingViewController.swift
//  BrewT
//
//  Created by David Trautmann on 20.09.14.
//  Copyright (c) 2014 David Trautmann. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openUrl() {
        
        let targetURL = NSURL.URLWithString("https://flic.kr/p/6QWVET")
        
        let application = UIApplication.sharedApplication()
        
        application.openURL(targetURL);
        
    }
}
