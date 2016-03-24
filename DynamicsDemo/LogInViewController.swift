//
//  LogInViewController.swift
//  DynamicsDemo
//
//  Created by Nareg Khoshafian on 3/24/16.
//  Copyright © 2016 Intrepid. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    // http://www.teehanlax.com/blog/introduction-to-uikit-dynamics/
    private var animator: UIDynamicAnimator!
    // WHen you create this behavior it is mostly associtied with a set of items - typically a view.
    // 1. Create a variable that will implement the behavior
    private var gravity: UIGravityBehavior!
    private var collision: UICollisionBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        
        // dynamics only affect views that have been associated with behaviors.
        let square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        let barrier = UIView(frame: CGRect(x: 0, y: 300, width: 130, height: 50))
        
        barrier.backgroundColor = UIColor.redColor()
        square.backgroundColor = UIColor.grayColor()
        
        view.addSubview(square)
        view.addSubview(barrier)
        
        animator = UIDynamicAnimator(referenceView: view)
        // 2. Tell the variable tells us what we want to implemnt this behavior on.
        gravity = UIGravityBehavior(items: [square])
        collision = UICollisionBehavior(items: [square, barrier])
        
        gravity.gravityDirection = CGVector(dx: 0.0, dy: 1.0)
        collision.translatesReferenceBoundsIntoBoundary = true
        
        // 3. Lastly, we want to add the Behavior to our animator.
        animator.addBehavior(collision)
        animator.addBehavior(gravity)
    }
    
    
}

