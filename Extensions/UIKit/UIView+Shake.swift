//
//  UIView+Shake.swift
//  Swiftex
//
//  Created by Vitaliy Kuzmenko on 15/11/2016.
//  Copyright © 2016 KuzmenkoFamily. All rights reserved.
//

import UIKit

extension UIView {
    
    func shake(_ completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: { (finished) -> Void in
            delay(0.3, closure: { () -> Void in
                completion?()
            })
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 5, options: UIViewAnimationOptions.curveEaseOut, animations: { () -> Void in
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            }) { (finished: Bool) -> Void in
                
            }
        })
    }
    
    func shakeHorisonal(_ complete: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: 0.05, animations: { () -> Void in
            var point = self.center
            point.x = point.x + 10
            self.center = point
        }, completion: { (f) -> Void in
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.7, options: UIViewAnimationOptions.allowUserInteraction, animations: { () -> Void in
                var point = self.center
                point.x = point.x - 10
                self.center = point
            }, completion: complete)
        })
    }
    
}

