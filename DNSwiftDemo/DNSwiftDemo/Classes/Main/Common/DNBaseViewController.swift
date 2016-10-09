//
//  DNBaseViewController.swift
//  DNSwiftDemo
//
//  Created by mainone on 16/9/22.
//  Copyright © 2016年 wjn. All rights reserved.
//

import UIKit

class DNBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = DNVCBackViewColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
    }

}
