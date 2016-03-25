//
//  UserProfileViewController.swift
//  DynamicsDemo
//
//  Created by Nareg Khoshafian on 3/24/16.
//  Copyright © 2016 Intrepid. All rights reserved.
//

import UIKit

var loggedIn = false

class UserProfileViewController: UIViewController {
    
    
    @IBAction func logOutButtonPressed(sender: AnyObject) {
        self.presentViewController(LogInViewController(), animated: true, completion: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        viewDidAppearSetup()
    }

    private func viewDidAppearSetup() {
        if !loggedIn {
            self.presentViewController(LogInViewController(), animated: true, completion: nil)
        }
    }
}
