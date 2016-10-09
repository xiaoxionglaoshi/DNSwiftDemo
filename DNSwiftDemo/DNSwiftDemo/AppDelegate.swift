//
//  AppDelegate.swift
//  DNSwiftDemo
//
//  Created by mainone on 16/9/22.
//  Copyright © 2016年 wjn. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // 初始化屏幕方向
        UIApplication.shared.setStatusBarOrientation(.portrait, animated: true)
        
        // 创建window
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.backgroundColor = UIColor.white
        
        // 检测用户是不是首次安装
        if !UserDefaults.standard.bool(forKey: G_FirstLauch) {
            self.window?.rootViewController = DNGuidePageViewController()
            UserDefaults.standard.set(true, forKey: G_FirstLauch)
        } else {
            self.window?.rootViewController = DNTabBarViewController()
        }
        
        
        return true
    }
    
    // 程序暂行
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    // 程序进入后台
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    // 程序进入前台
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    
    // 程序从新激活
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    // 程序意外退出
    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
    
    
}

