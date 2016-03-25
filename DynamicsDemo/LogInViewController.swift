//
//  LogInViewController.swift
//  DynamicsDemo
//
//  Created by Nareg Khoshafian on 3/24/16.
//  Copyright © 2016 Intrepid. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
    
    }

    @IBAction func logInButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        loggedIn = true
    }
}

