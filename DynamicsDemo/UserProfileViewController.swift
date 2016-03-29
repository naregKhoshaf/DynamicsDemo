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
    
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var hamburgerMenuView: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if !loggedIn {
            self.presentViewController(LogInViewController(), animated: false, completion: nil)
        }
    }
    
    private func setup() {
        
        hamburgerMenuView.transform = CGAffineTransformMakeScale(2, 2)
        animationView.frame.size.height = UIScreen.mainScreen().bounds.height

        UIView.animateWithDuration(2.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 4, options: .CurveEaseOut, animations: {
            
            self.hamburgerMenuView.transform = CGAffineTransformMakeScale(1, 1)
            self.animationView.frame.size.height = 10

            }, completion: nil)
    }
    
    @IBAction func logOutButtonPressed(sender: AnyObject) {
        self.presentViewController(LogInViewController(), animated: true, completion: nil)
    }
}
