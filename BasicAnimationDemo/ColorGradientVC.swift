//
//  ColorGradientVC.swift
//  BasicAnimationDemo
//
//  Created by Kaibo Lu on 2017/2/11.
//  Copyright © 2017年 Kaibo Lu. All rights reserved.
//

import UIKit

class ColorGradientVC: UIViewController {

    private var layer: CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Color gradient"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start", style: .plain, target: self, action: #selector(start))
        view.backgroundColor = .white
        
        layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 100, width: view.bounds.width, height: 300)
        layer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 1)
        layer.endPoint = CGPoint(x: 1, y: 0)
        view.layer.addSublayer(layer)
    }
    
    @objc private func start() {
        let animation = CABasicAnimation(keyPath: "colors")
        animation.toValue = [UIColor.orange.cgColor, UIColor.purple.cgColor, UIColor.blue.cgColor]
        animation.duration = 2
        animation.isRemovedOnCompletion = false // do not remove animation when completed
        animation.fillMode = .forwards // remain animation final state
        layer.add(animation, forKey: "")
        
        let animation2 = CABasicAnimation(keyPath: "startPoint")
        animation2.toValue = CGPoint(x: 0, y: 0)
        animation2.duration = 2
        animation2.isRemovedOnCompletion = false // do not remove animation when completed
        animation2.fillMode = .forwards // remain animation final state
        layer.add(animation2, forKey: "")
        
        let animation3 = CABasicAnimation(keyPath: "endPoint")
        animation3.toValue = CGPoint(x: 1, y: 1)
        animation3.duration = 2
        animation3.isRemovedOnCompletion = false // do not remove animation when completed
        animation3.fillMode = .forwards // remain animation final state
        layer.add(animation3, forKey: "")
    }

}
