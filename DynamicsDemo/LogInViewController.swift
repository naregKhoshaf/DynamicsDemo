//
//  LogInViewController.swift
//  DynamicsDemo
//
//  Created by Nareg Khoshafian on 3/24/16.
//  Copyright © 2016 Intrepid. All rights reserved.
//


// 3 Steps to have a custom transition:
// 1. Create a class that implements the UIViewControllerAnimatedTransitioning protocol
// - Here you will write code that performs the animation. 
// 2. Before presenting a view controller, set a class as its transitioning delegate.  The delegate
// will get a call back for the animation controller to be used when presenting the view controller
// 3. Implement the callback method to return an instance of the animation controller from the first step.

import UIKit

// STEP ONE: CREATE A NEW CLASS THAT IS A SUBCLASS OF NSOBJECT WHICH ALSO ABIDES BY THE 
// UIViewControllerAnimatedTransitioning PROTOCOL

// UIViewControllerAnimatedTransitioning PROTOCOL has 2 required methods:
// 1. transitionDuration()
// 2. animateTransition()
class CustomDismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    // 1. This required method specifies the length of the transition animation.
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 2.5
    }
    // 2. This required method uses the transitionContext to get the view controller we are navigating from(LogInViewController), to (UserProfileViewController), the final frame the transition contaxt should have after the animation completes and the container view which houses the views corrosponding to the, to and from view controllers
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let finalFrameForVC = transitionContext.finalFrameForViewController(toViewController)
        // This holds the to/from controllers
        let containerView = transitionContext.containerView()
        containerView?.backgroundColor = UIColor.blackColor()
        // We position the toView just below the bottom of the screen.
        let bounds = UIScreen.mainScreen().bounds
        toViewController.view.frame = CGRectOffset(finalFrameForVC, 0, bounds.size.height)
        containerView!.addSubview(toViewController.view)

        // The transition used here is the same as the one defined above.
        UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: .CurveLinear, animations: {
            fromViewController.view.alpha = 0
            toViewController.view.frame = CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height + 200 )
            }, completion: {
                finished in
                transitionContext.completeTransition(true)
                fromViewController.view.alpha = 1.0
        })
    }
}

class LogInViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    let customDismissAnimation = CustomDismissAnimationController()

// STEP TWO:
    private func setup() {
        self.transitioningDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
// STEP THREE:
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customDismissAnimation
    }
    
    @IBAction func logInButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        loggedIn = true
    }
}

