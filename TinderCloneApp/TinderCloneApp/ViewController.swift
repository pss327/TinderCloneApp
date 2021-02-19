//
//  ViewController.swift
//  TinderCloneApp
//
//  Created by kiyoungj on 2021/02/19.
//

import UIKit

class ViewController: UIViewController {
    
    let topStackView = TopNavigationStackView()
    let cardsDeckView = UIView()
    let homeBottomStackView = HomeBottomControlsStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupDummyCards()
    }
    
    fileprivate func setupDummyCards(){
        print("Setting up dummy cards")
        let dummyCardView = CardView(frame: .zero)
        cardsDeckView.addSubview(dummyCardView)
        dummyCardView.fillSuperview()
    }
    
    fileprivate func setupLayout() {
        
        let overallStackView = UIStackView(arrangedSubviews: [
            topStackView,
            cardsDeckView,
            homeBottomStackView
        ])
        
        overallStackView.axis = .vertical
        view.addSubview(overallStackView)
        
        overallStackView.anchor (
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.leadingAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            trailing: view.trailingAnchor
        )
        
        overallStackView.isLayoutMarginsRelativeArrangement = true
        overallStackView.layoutMargins = .init(top: 0, left: 10, bottom: 0, right: 10 )
        
        overallStackView.bringSubviewToFront(cardsDeckView)
        
    }
    
}

