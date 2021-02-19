//
//  CardView.swift
//  TinderCloneApp
//
//  Created by kiyoungj on 2021/02/20.
//

import Foundation
import UIKit


class CardView : UIView {
    
    fileprivate let imageView = UIImageView(image: #imageLiteral(resourceName: "lady5c"))
    
    fileprivate let threshold: CGFloat = 80
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 10
        clipsToBounds = true
        
        addSubview(imageView)
        imageView.fillSuperview()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        
        addGestureRecognizer(panGesture)
    }
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        
        switch gesture.state {
        
        case .changed:
            handleChanged(gesture: gesture)
        case .ended:
            handleEnded(gesture: gesture)
        default:
            ()
        }
    }
    
    fileprivate func handleChanged(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: nil)
        let degree : CGFloat = translation.x / 20
        let angle = degree * .pi / 180
        
        let rotationTransformation = CGAffineTransform(rotationAngle: angle)
        self.transform = rotationTransformation.translatedBy(x: translation.x, y: translation.y)
        
        
    }
    
    fileprivate func handleEnded(gesture: UIPanGestureRecognizer){
        
        let translationDirection : CGFloat = gesture.translation(in: nil).x > 0 ? 1 : -1
        let shoudDismissCard = abs(gesture.translation(in: nil).x) > threshold
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            
            if shoudDismissCard {
                self.frame = CGRect(x: 1000*translationDirection, y: 0, width: self.frame.width, height: self.frame.height)
            }else{
                self.transform = .identity
            }
            
        }){_ in
            
            self.transform = .identity
            self.frame = CGRect(x: 0, y: 0, width: self.superview!.frame.width, height: self.superview!.frame.height)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
