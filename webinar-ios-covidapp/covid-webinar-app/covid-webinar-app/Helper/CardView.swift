//
//  CardView.swift
//  covid-webinar-app
//
//  Created by IRFAN TRIHANDOKO on 02/04/20.
//  Copyright © 2020 Muhammad Arif. All rights reserved.
//

import UIKit

public class CardView: UIView {
    
    @IBInspectable public var cornerRadius: CGFloat = 1 //default
    @IBInspectable public var shadow: CGFloat = 1 //default
    @IBInspectable public var shadowRadius: CGFloat = 2.0
    @IBInspectable public var borderWidth: CGFloat = 0.0
    @IBInspectable public var borderColor: UIColor = .lightGray
    
    public init(frame: CGRect, cornerRadius: CGFloat = 1, shadow: CGFloat = 1, shadowRadius: CGFloat = 2, borderWidth: CGFloat = 0, borderColor: UIColor = .clear) {
        super.init(frame: frame)
        self.cornerRadius = cornerRadius
        self.shadow = shadow
        self.shadowRadius = shadowRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override public func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.masksToBounds = false
        layer.shadowColor = UIColor.gray.cgColor
        if shadow != 0 {
            layer.shadowOffset = CGSize(width: 0, height: shadow)
            layer.shadowOpacity = 0.4
            layer.shadowRadius = shadowRadius
            layer.shadowPath = shadowPath.cgPath
        }
        layer.borderWidth = borderWidth
    }
    
    public func reload() {
        setNeedsDisplay()
        layer.displayIfNeeded()
    }
}

