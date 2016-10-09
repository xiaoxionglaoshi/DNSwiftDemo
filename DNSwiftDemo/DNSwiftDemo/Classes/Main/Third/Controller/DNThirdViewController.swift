//
//  DNThirdViewController.swift
//  DNSwiftDemo
//
//  Created by mainone on 16/9/22.
//  Copyright © 2016年 wjn. All rights reserved.
//

import UIKit

private let cellIdentifier = "cellID"


class DNThirdViewController: DNBaseViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(DNThirdViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArray[section].count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! DNThirdViewCell

        cell.cellModel = self.dataArray[indexPath.section][indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private lazy var tableView: UITableView = {
        let tableV = UITableView(frame: self.view.frame, style: .grouped)
        tableV.sectionHeaderHeight = 10
        tableV.sectionFooterHeight = 10
        tableV.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 20))
        
        tableV.delegate = self
        tableV.dataSource = self
        
        self.view.addSubview(tableV)
        
        return tableV
    }()
    
    private lazy var dataArray: Array<Array<Dictionary<String, String>>> = {
        let dataArr = [
            [
                ["image" : "AlbumReflashIcon", "title" : "朋友圈"]
            ],
            [
                ["image" : "ff_IconQRCode", "title" : "扫一扫"],
                ["image" : "ff_IconShake", "title" : "摇一摇"]
            ],
            [
                ["image" : "ff_IconLocationService", "title" : "附近的人"],
                ["image" : "ff_IconBottle", "title" : "漂流瓶"]
            ],
            [
                ["image" : "CreditCard_ShoppingBag", "title" : "购物"],
                ["image" : "MoreGame", "title" : "游戏"]
            ]
            
        ]
        return dataArr
    }()
    
}

private class DNThirdViewCell: UITableViewCell {
    
    
    private lazy var cellImageView =  UIImageView()
    private lazy var cellTitleLabel = UILabel()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator
        
        self.setUIView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var cellModel: Dictionary<String, String>? {
        didSet {
            cellImageView.image = UIImage(named: (cellModel?["image"])!)
            cellTitleLabel.text = cellModel?["title"]
            
            cellImageView.frame = CGRect(x: 15, y: 10, width: contentView.frame.size.height - 20, height: contentView.frame.size.height - 20)
            cellTitleLabel.frame = CGRect(x: contentView.frame.size.height + 5, y: 0, width: contentView.frame.size.width - contentView.frame.size.height - 50, height: contentView.frame.size.height)
            
        }
    }
    
    private func setUIView() {
        contentView.addSubview(cellImageView)
        contentView.addSubview(cellTitleLabel)
    }
    
}


