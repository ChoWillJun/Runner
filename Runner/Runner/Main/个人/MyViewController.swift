//
//  MyViewController.swift
//  Runner
//
//  Created by ☁️WillJun_Cho on 17/01/2018.
//  Copyright © 2018 ☁️WillJun_Cho. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    let MyTableView: UITableView = UITableView.init(frame: CGRect.zero, style: .grouped)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addTableViewAction()
    }
    
    func addTableViewAction() {
        MyTableView.dataSource = self
        MyTableView.delegate = self
        MyTableView.backgroundColor = .white
        MyTableView.rowHeight = 60
        MyTableView.isScrollEnabled = false
        MyTableView.separatorStyle = .none
        MyTableView.register(UINib(nibName: String(describing: MyTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MyTableViewCell.self))
        self.view.addSubview(MyTableView)
        
        MyTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
        MyTableView.tableHeaderView = titleView
        titleView.snp.makeConstraints { (make) in
            make.width.equalTo(SCREEN_WIDTH * 0.75)
            make.height.equalTo(120)
            make.top.equalToSuperview().offset(20)
        }
    }
    
    
    
    //MARK: Lazy
    lazy var titleView: MyTableHeaderView = {
        let view = Bundle.main.loadNibNamed(String(describing: MyTableHeaderView.self), owner: self, options: nil)?.last as! MyTableHeaderView
        view.nameLabel.text = "你猜猜猜"
//        view.headImageView.image = UIImage.init(named: IMAGE_USER_HEADIMG)
        return view
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MyTableViewCell.self), for: indexPath) as! MyTableViewCell
        cell.addCellData(indexPath: indexPath)
        
        return cell
    }
    
    
    
}
