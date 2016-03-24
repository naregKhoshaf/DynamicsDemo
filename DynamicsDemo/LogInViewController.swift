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
        self.presentViewController(UserProfileViewController(), animated: true, completion: nil)
    }
    
    private var animator: UIDynamicAnimator!

    // When you create this behavior it is mostly associtied with a set of items - typically a view.
    // 1. Create a variable that will implement the behavior
    private var gravity: UIGravityBehavior!
    private var collision: UICollisionBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: view)
        setup()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        transition()
    }
    
    private func setup() {
        // dynamics only affect views that have been associated with behaviors.
        let square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        let barrier = UIView(frame: CGRect(x: 0, y: 300, width: 130, height: 50))
        
        barrier.backgroundColor = UIColor.blueColor()
        square.backgroundColor = UIColor.grayColor()
        
        view.addSubview(square)
        view.addSubview(barrier)
        
        
        // 2. Tell the variable tells us what we want to implemnt this behavior on.
        gravity = UIGravityBehavior(items: [square])
        collision = UICollisionBehavior(items: [square, barrier])
        
        gravity.gravityDirection = CGVector(dx: 0.0, dy: 1.0)
        collision.translatesReferenceBoundsIntoBoundary = true
        
        // 3. Lastly, we want to add the Behavior to our animator.
        animator.addBehavior(collision)
        animator.addBehavior(gravity)
    }
    
    private func transition() {
        // Intialize
        let collisionBehavior: UICollisionBehavior = UICollisionBehavior(items: [self.view])
        let gravityBehavior = UIGravityBehavior(items: [self.view])
        let pushBehavior: UIPushBehavior = UIPushBehavior(items: [self.view], mode: UIPushBehaviorMode.Instantaneous)
        let itemBehavior: UIDynamicItemBehavior = UIDynamicItemBehavior(items: [self.view])

        // Behavior
        gravityBehavior.gravityDirection = CGVector(dx: -1.0, dy: 0.0)
        
        collisionBehavior.setTranslatesReferenceBoundsIntoBoundaryWithInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -288))
        
        pushBehavior.magnitude = 0.0
        pushBehavior.angle = 0.0
        
        itemBehavior.elasticity = 0.45
        
        // Add Behavior
        self.animator.addBehavior(collisionBehavior)
        self.animator.addBehavior(gravityBehavior)
        self.animator.addBehavior(pushBehavior)
        self.animator.addBehavior(itemBehavior)
    }
}

