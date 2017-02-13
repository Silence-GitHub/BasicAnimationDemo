//
//  BackgroundColorVC.swift
//  BasicAnimationDemo
//
//  Created by Kaibo Lu on 2017/2/11.
//  Copyright © 2017年 Kaibo Lu. All rights reserved.
//

import UIKit

class BackgroundColorVC: UIViewController {

    private var layer: CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Background color"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start", style: .plain, target: self, action: #selector(start))
        view.backgroundColor = .white
        
        layer = CALayer()
        layer.frame = view.bounds
        layer.backgroundColor = UIColor.blue.cgColor
        view.layer.addSublayer(layer)
    }
    
    @objc private func start() {
        let animation = CABasicAnimation(keyPath: "backgroundColor")
        animation.fromValue = UIColor.blue.cgColor
        animation.toValue = UIColor.yellow.cgColor
        animation.duration = 2
        animation.isRemovedOnCompletion = false // do not remove animation when completed
        animation.fillMode = kCAFillModeForwards // remain animation final state
        layer.add(animation, forKey: "")
    }

}
