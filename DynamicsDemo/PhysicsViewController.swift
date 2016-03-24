//
//  PhysicsViewController.swift
//  DynamicsDemo
//
//  Created by Nareg Khoshafian on 3/23/16.
//  Copyright © 2016 Intrepid. All rights reserved.
//

import UIKit

class PhysicsViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        let square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        square.backgroundColor = UIColor.grayColor()
        view.addSubview(square)
        
        //
        var animator: UIDynamicAnimator!
        var gravity: UIGravityBehavior!
        
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square])
        
        animator.addBehavior(gravity)
    }
}
