//
//  ActivitySpinnerView.swift
//  ActivitySpinner
//
//  Created by Mark Wilkinson on 11/30/17.
//  Copyright © 2017 Mark Wilkinson. All rights reserved.
//

import UIKit

class ActivitySpinnerView : UIView {
    
    let circleLayer = CAShapeLayer()
    
    @IBInspectable var lineWidth: CGFloat = 8 {
        didSet {
            circleLayer.lineWidth = lineWidth
            setNeedsLayout()
        }
    }
    
    @IBInspectable var animating: Bool = true {
        didSet {
            updateAnimation()
        }
    }
    
    let rotationAnimation : CAAnimation = {
        
        let rotation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.fromValue = 0
        rotation.toValue = Double.pi * 2
        rotation.duration = 1
        rotation.repeatCount = MAXFLOAT
        
        return rotation
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        
        self.layer.masksToBounds = false
        circleLayer.lineWidth = self.lineWidth
        circleLayer.fillColor = nil
        circleLayer.strokeColor = UIColor.red.cgColor
        layer.addSublayer(circleLayer)
        self.layer.cornerRadius = 10.0
        updateAnimation()
        setNeedsLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = (min(bounds.width, bounds.height) / 2 - circleLayer.lineWidth) - 4
        
        let startAngle = CGFloat(-Double.pi/4)
        let endAngle = CGFloat(Double.pi/2)
        let path = UIBezierPath(arcCenter: CGPoint.zero, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        circleLayer.position = center
        circleLayer.path = path.cgPath
    }
    
    func updateAnimation() {
        if animating {
            circleLayer.add(rotationAnimation, forKey: "rotation")
        }
        else {
            circleLayer.removeAnimation(forKey: "rotation")
        }
    }
    
}
