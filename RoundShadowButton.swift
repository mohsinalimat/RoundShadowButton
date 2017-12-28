//
//  RoundShadowButton.swift
//  JYHealth
//
//  Created by 骆扬 on 2017/12/14.
//  Copyright © 2017年 LY. All rights reserved.
//

import UIKit

@IBDesignable
class RoundShadowButton: UIControl {
    let button: UIButton = {
        let button = UIButton.init(type: .custom)
            button.layer.masksToBounds = true
        return button
    }()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        self.addSubview(button)
    }
    
    // MARK: - Style
    // MARK: image
    @IBInspectable var image: UIImage? {
        didSet {
            button.setImage(image, for: .normal)
        }
    }
    
    // MARK: shadow
    @IBInspectable var shadowColor: UIColor? {
        didSet {
            setShadow()
        }
    }
    func setShadow() {
        guard let color = shadowColor else {
            return
        }
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize.init(width: 0, height: 2)
        layer.shadowOpacity = 0.9
        layer.shadowRadius = 3
        self.clipsToBounds = false  // 为ture的时候阴影显示不出来
    }
    // MARK: border
    @IBInspectable var borderColor: UIColor? {
        didSet {
            setBorder()
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            setBorder()
        }
    }
    func setBorder() {
        guard let color = borderColor else {
            return
        }
        button.layer.borderColor = color.cgColor
        button.layer.borderWidth = borderWidth
    }
    
    
    // MARK: - Override
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = self.bounds
        
        let radius = self.width/2
        button.layer.cornerRadius = radius
        layer.cornerRadius = radius
    }
    
    override func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents) {
        button.addTarget(target, action: action, for: controlEvents)
    }
}

