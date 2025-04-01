//
//  ViewController.swift
//  UIOverlayView
//
//  Created by Sfh03031 on 03/31/2025.
//  Copyright (c) 2025 Sfh03031. All rights reserved.
//

import UIKit
import UIOverlayView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(255)) / 255.0, green: CGFloat(arc4random_uniform(255)) / 255.0, blue: CGFloat(arc4random_uniform(255)) / 255.0, alpha: 1.0)
        
        self.view.addSubview(showBtn)
        self.view.addSubview(hideBtn)
        self.view.addSubview(pushBtn)
        
        let y = self.view.bounds.height - 100
        let x = self.view.bounds.width - 170
        showBtn.frame = CGRect(x: 20, y: y, width: 150, height: 50)
        hideBtn.frame = CGRect(x: x, y: y, width: 150, height: 50)
        pushBtn.center = self.view.center
    }
    
    @objc func show(_ sender: UIButton) {
        UIOverlayView.show()
    }
    
    @objc func hide(_ sender: UIButton) {
        UIOverlayView.hide()
    }
    
    @objc func push(_ sender: UIButton) {
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
    }
    
    lazy var showBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(255)) / 255.0, green: CGFloat(arc4random_uniform(255)) / 255.0, blue: CGFloat(arc4random_uniform(255)) / 255.0, alpha: 1.0)
        btn.setTitle("tap to show", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 5.0
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(show(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var hideBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(255)) / 255.0, green: CGFloat(arc4random_uniform(255)) / 255.0, blue: CGFloat(arc4random_uniform(255)) / 255.0, alpha: 1.0)
        btn.setTitle("tap to hide", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 5.0
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(hide(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var pushBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: 0, width: 150, height: 50)
        btn.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(255)) / 255.0, green: CGFloat(arc4random_uniform(255)) / 255.0, blue: CGFloat(arc4random_uniform(255)) / 255.0, alpha: 1.0)
        btn.setTitle("tap to push", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 5.0
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(push(_:)), for: .touchUpInside)
        return btn
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

