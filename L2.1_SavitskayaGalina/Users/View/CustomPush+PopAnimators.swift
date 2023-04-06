//
//  CustomPush+PopAnimators.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 25.05.2022.
//

import UIKit

class PushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private let animationDuration: TimeInterval = 1
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else {return}
         
        transitionContext.containerView.addSubview(destination.view)
        transitionContext.containerView.sendSubviewToBack(destination.view)
        
        destination.view.layer.anchorPoint = CGPoint(x: 1, y: 0)
        destination.view.frame = transitionContext.containerView.frame
        
        destination.view.transform = CGAffineTransform(rotationAngle: -.pi/2)
        
        source.view.layer.anchorPoint = CGPoint(x: 0, y: 0)
        source.view.frame = transitionContext.containerView.frame
        
        UIView.animate(withDuration: animationDuration, delay: 0, options: .curveEaseInOut, animations: {
            source.view.transform = CGAffineTransform(rotationAngle: .pi/2)
            
            destination.view.transform = .identity
        })
        { (isCompleete) in
            if transitionContext.transitionWasCancelled {
                destination.view.transform = .identity
            }
            transitionContext.completeTransition(isCompleete && !transitionContext.transitionWasCancelled)
        }
    }
}

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private let animationDuration: TimeInterval = 1
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
            guard let source = transitionContext.viewController(forKey: .from),
                  let destination = transitionContext.viewController(forKey: .to) else {return}
             
            transitionContext.containerView.addSubview(destination.view)
            transitionContext.containerView.sendSubviewToBack(destination.view)
            
            destination.view.layer.anchorPoint = CGPoint(x: 0, y: 0)
            destination.view.frame = transitionContext.containerView.frame
            
            destination.view.transform = CGAffineTransform(rotationAngle: .pi/2)
            
            source.view.layer.anchorPoint = CGPoint(x: 1, y: 0)
            source.view.frame = transitionContext.containerView.frame
            
            UIView.animate(withDuration: animationDuration, delay: 0, options: .curveEaseInOut, animations: {
                source.view.transform = CGAffineTransform(rotationAngle: -.pi/2)
                
                destination.view.transform = .identity
            })
            { (isCompleete) in
                if transitionContext.transitionWasCancelled {
                    destination.view.transform = .identity
                }
                transitionContext.completeTransition(isCompleete && !transitionContext.transitionWasCancelled)
            }
        }
    }
