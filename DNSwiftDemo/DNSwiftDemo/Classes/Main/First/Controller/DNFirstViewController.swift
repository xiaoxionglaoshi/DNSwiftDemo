//
//  DNFirstViewController.swift
//  DNSwiftDemo
//
//  Created by mainone on 16/9/22.
//  Copyright © 2016年 wjn. All rights reserved.
//

import UIKit



class DNFirstViewController: DNBaseViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let webVC = DNWebViewController(nibName: "DNWebViewController", bundle: nil)
        webVC.webUrlString = "https://www.google.com"
        self.navigationController?.pushViewController(webVC, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}


