//
//  DNContactModel.swift
//  DNSwiftDemo
//
//  Created by mainone on 16/9/26.
//  Copyright © 2016年 wjn. All rights reserved.
//

import UIKit

class DNContactModel: NSObject {
    var name: String?
    var image: String?
    
    init(dict: [String: String]) {
        super.init()
        name = dict["name"]
        image = dict["image"]
    }
}
