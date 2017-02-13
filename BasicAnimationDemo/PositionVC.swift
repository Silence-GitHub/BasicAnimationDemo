//
//  PositionVC.swift
//  BasicAnimationDemo
//
//  Created by Kaibo Lu on 2017/2/11.
//  Copyright © 2017年 Kaibo Lu. All rights reserved.
//

import UIKit

class PositionVC: UIViewController {

    private var layer: CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Position"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start", style: .plain, target: self, action: #selector(start))
        view.backgroundColor = .white
        
        layer = CALayer()
        layer.frame = CGRect(x: 0, y: 64, width: 20, height: 20)
        layer.backgroundColor = UIColor.blue.cgColor
        view.layer.addSublayer(layer)
    }
    
    @objc private func start() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: 10, y: 74)
        animation.toValue = CGPoint(x: 100, y: 200)
        animation.duration = 2
        animation.isRemovedOnCompletion = false // do not remove animation when completed
        animation.fillMode = kCAFillModeForwards // remain animation final state
        layer.add(animation, forKey: "")
    }

}
