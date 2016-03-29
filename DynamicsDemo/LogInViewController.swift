//
//  LogInViewController.swift
//  DynamicsDemo
//
//  Created by Nareg Khoshafian on 3/24/16.
//  Copyright © 2016 Intrepid. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBAction func logInButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
        loggedIn = true
    }
}

