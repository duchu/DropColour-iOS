//
//  Button.swift
//  ELColorGame
//
//  Created by Mateusz Szklarek on 26/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

class Button: UIButton {
    
    typealias ButtonActionClosure = () -> ()
    var buttonActionClosure: ButtonActionClosure?
    
    init(title: String, color: UIColor) {
        super.init(frame: CGRectZero)
        
        setTitle(title, forState: UIControlState.Normal)
        titleLabel?.font = UIFont(name: BebasNeueBold, size: 22)
        contentEdgeInsets = UIEdgeInsetsMake(4.5, 0, 0, 0)
        setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        layer.cornerRadius = 25.0
        backgroundColor = color
        configureButtonAction()
    }
    
    init(image: UIImage?) {
        super.init(frame: CGRectZero)
        
        setImage(image, forState: .Normal)
        configureButtonAction()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func configureButtonAction() {
        addTarget(self, action: Selector("didTapOnButton:"), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func didTapOnButton(sender: UIButton) {
        buttonActionClosure?()
    }
    
}
