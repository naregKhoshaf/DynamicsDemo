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
class CustomPresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    // 1. This required method specifies the length of the transition animation.
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 2.5
    }
    // 2. This required method uses the transitionContext to get the view controller we are navigating
    // from(LogInViewController, to (UserProfileViewController), the final frame the transition contaxt should have after the animation completes and the container view which houses the views corrosponding to the, to and from view controllers
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let finalFrameForVC = transitionContext.finalFrameForViewController(toViewController)
        let containerView = transitionContext.containerView()
        let bounds = UIScreen.mainScreen().bounds
        toViewController.view.frame = CGRectOffset(finalFrameForVC, 0, bounds.size.height)
        containerView!.addSubview(toViewController.view)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: .CurveLinear, animations: {
            fromViewController.view.alpha = 0.5
            toViewController.view.frame = CGRect(x: 0, y: 50, width: bounds.size.width, height: bounds.size.height)
            }, completion: {
                finished in
                transitionContext.completeTransition(true)
                fromViewController.view.alpha = 1.0
        })
    }
}

class LogInViewController: UIViewController {
    
    @IBAction func logInButtonPressed(sender: AnyObject) {
        self.presentViewController(UserProfileViewController(), animated: true, completion: nil)
    }

}

