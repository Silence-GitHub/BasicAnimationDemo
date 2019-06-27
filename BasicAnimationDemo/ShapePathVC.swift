//
//  ShapePathVC.swift
//  BasicAnimationDemo
//
//  Created by Kaibo Lu on 2017/2/11.
//  Copyright © 2017年 Kaibo Lu. All rights reserved.
//

import UIKit

class ShapePathVC: UIViewController {

    private var layer: CAShapeLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Shape path"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start", style: .plain, target: self, action: #selector(start))
        view.backgroundColor = .white
        
        layer = CAShapeLayer()
        layer.frame = CGRect(x: 0, y: 100, width: view.bounds.width, height: 300)
        layer.backgroundColor = UIColor.yellow.cgColor
        
        let path = UIBezierPath()
        layer.strokeColor = UIColor.clear.cgColor
        layer.fillColor = UIColor.clear.cgColor
        path.move(to: CGPoint(x: 10, y: 150))
        path.addCurve(to: CGPoint(x: 300, y: 150), controlPoint1: CGPoint(x: 110, y: 0), controlPoint2: CGPoint(x: 210, y: 300))
        
        layer.path = path.cgPath
        view.layer.addSublayer(layer)
    }
    
    @objc private func start() {
        layer.lineCap = .round
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        animation.isRemovedOnCompletion = false // do not remove animation when completed
        animation.fillMode = .forwards // remain animation final state
        layer.add(animation, forKey: "")
        
        let animation2 = CABasicAnimation(keyPath: "lineWidth")
        animation2.fromValue = 0
        animation2.toValue = 10
        animation2.duration = 2
        animation2.isRemovedOnCompletion = false // do not remove animation when completed
        animation2.fillMode = .forwards // remain animation final state
        layer.add(animation2, forKey: "")
        
        let animation3 = CABasicAnimation(keyPath: "strokeColor")
        animation3.fromValue = UIColor.red.cgColor
        animation3.toValue = UIColor.blue.cgColor
        animation3.duration = 2
        animation3.isRemovedOnCompletion = false // do not remove animation when completed
        animation3.fillMode = .forwards // remain animation final state
        layer.add(animation3, forKey: "")
    }

}
