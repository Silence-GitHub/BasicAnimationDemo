//
//  ShapeMaskVC.swift
//  BasicAnimationDemo
//
//  Created by Kaibo Lu on 2017/2/13.
//  Copyright © 2017年 Kaibo Lu. All rights reserved.
//

import UIKit

class ShapeMaskVC: UIViewController {

    private var layer: CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Shape mask"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start", style: .plain, target: self, action: #selector(start))
        view.backgroundColor = .white
        
        layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 100, width: view.bounds.width, height: 200)
        layer.colors = [UIColor.red.cgColor, UIColor.clear.cgColor]
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 10, y: 150))
        path.addLine(to: CGPoint(x: 60, y: 150))
        path.addLine(to: CGPoint(x: 110, y: 150))
        path.addLine(to: CGPoint(x: 160, y: 150))
        path.addLine(to: CGPoint(x: 210, y: 150))
        path.addLine(to: CGPoint(x: 260, y: 150))
        path.addLine(to: CGPoint(x: 310, y: 150))
        path.close()
        
        let mask = CAShapeLayer()
        mask.frame = layer.bounds
        mask.path = path.cgPath
        layer.mask = mask
        
        view.layer.addSublayer(layer)
    }
    
    @objc private func start() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 10, y: 150))
        path.addLine(to: CGPoint(x: 60, y: 100))
        path.addLine(to: CGPoint(x: 110, y: 80))
        path.addLine(to: CGPoint(x: 160, y: 130))
        path.addLine(to: CGPoint(x: 210, y: 10))
        path.addLine(to: CGPoint(x: 260, y: 100))
        path.addLine(to: CGPoint(x: 310, y: 150))
        path.close()
        
        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = (layer.mask as! CAShapeLayer).path
        animation.toValue = path.cgPath
        animation.duration = 2
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        layer.mask?.add(animation, forKey: "")
    }

}
