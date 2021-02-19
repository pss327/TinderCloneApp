//
//  HomeBottomControlsStackView.swift
//  TinderCloneApp
//
//  Created by kiyoungj on 2021/02/20.
//

import Foundation
import UIKit

class HomeBottomControlsStackView: UIStackView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        distribution = .fillEqually
        heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let subViews = [#imageLiteral(resourceName: "refresh_circle"), #imageLiteral(resourceName: "dismiss_circle"), #imageLiteral(resourceName: "super_like_circle"), #imageLiteral(resourceName: "like_circle"), #imageLiteral(resourceName: "boost_circle")].map { image -> UIView in
            
            let button = UIButton(type: .system)
            button.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
            return button
        }
        
        subViews.forEach( { view in
            addArrangedSubview(view)
        })
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
