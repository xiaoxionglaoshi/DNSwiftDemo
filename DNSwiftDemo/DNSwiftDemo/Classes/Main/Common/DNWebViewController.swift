//
//  DNWebViewController.swift
//  DNSwiftDemo
//
//  Created by mainone on 16/9/22.
//  Copyright © 2016年 wjn. All rights reserved.
//

import UIKit

class DNWebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var webUrlString: String?
    
    deinit {
        print("deinit webVC")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(self.addWeixinShareView))
        
        
        self.webView.scrollView.delegate = self
        self.webView.scrollView.showsHorizontalScrollIndicator = false
        self.loadWebViewWithUrlString(urlString: self.webUrlString!)
        
    
        
    }
    // 加载网页
    private func loadWebViewWithUrlString(urlString: String) {
        if !urlString.isEmpty {
            if let url = URL(string: urlString) {
                self.webView.loadRequest(URLRequest(url: url))
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var shouldAutorotate: Bool {
        
        return true
    }

}

extension DNWebViewController: UIWebViewDelegate {
    func webViewDidStartLoad(_ webView: UIWebView) {
        debugPrint("网页开始加载")
        self.navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        debugPrint("网页结束加载")
        self.navigationItem.rightBarButtonItem?.isEnabled = true
        
        self.title = webView.stringByEvaluatingJavaScript(from: "document.title")
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        debugPrint("网页加载失败")
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        debugPrint("加载链接: \(request.url?.absoluteString)")
        
        return true
    }
}

extension DNWebViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let point = scrollView.contentOffset
        if point.x != 0 {
            scrollView.contentOffset = CGPoint(x: 0, y: point.y)
            //这里不要设置为CGPointMake(0, point.y)，这样我们在文章下面左右滑动的时候，就跳到文章的起始位置，不科学
        }
    }
}

extension DNWebViewController: DNCustomShareViewDelegate {
    
    func addWeixinShareView() {
        let shareArray = [["image":"qq_haoyou", "title":"QQ"],
                          ["image":"qq_kongjian", "title":"QQ空间"],
                          ["image":"weixin_haoyou", "title":"微信"],
                          ["image":"weixin_pengyouquan", "title":"朋友圈"],
                          ["image":"liulanqi_safari", "title":"Safari打开"],
                          ["image":"email", "title":"邮箱"],
                          ["image":"Action_Copy", "title":"复制链接"],
                          ["image":"Action_Collection", "title":"收藏网页"],
                          ["image":"Action_Refresh", "title":"刷新"],
                          ["image":"Action_Report", "title":"举报"]]
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 30))
        let headerTitleLabel = UILabel(frame: CGRect(x: 0, y: 9, width: headerView.frame.size.width, height: 11))
        headerTitleLabel.textAlignment = .center
        headerTitleLabel.textColor = UIColor(red: 99.0/255.0, green: 98.0/255.0, blue: 98.0/255.0, alpha: 1.0)
        headerTitleLabel.backgroundColor = UIColor.clear
        headerTitleLabel.font = UIFont.systemFont(ofSize: 11)
        if let usrStr = self.webView.request?.url?.host {
            headerTitleLabel.text = "网页由 \(usrStr) 提供"
        }
        headerView.addSubview(headerTitleLabel)
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 80))
        footerView.backgroundColor = UIColor.red
        
        let shareView = DNCustomShareView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        shareView.customHeaderView = headerView
        //        shareView.customFooterView = footerView
        
        let height = shareView.getBoderViewHeight(shareArray as [AnyObject], myFirstCount: 6)
        shareView.boderView.frame = CGRect(x: 0, y: 0, width: shareView.frame.size.width, height: height)
        shareView.setShare(shareArray as Array<AnyObject>, delegate: self)
        self.view.window?.addSubview(shareView)
        
    }
    
    func customShareViewButtonAction(_ shareView: DNCustomShareView, title: String) {
        sleep(2)
        debugPrint("点击了 \(title)")
        
    }
}
