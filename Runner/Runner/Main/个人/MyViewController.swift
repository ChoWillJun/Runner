//
//  MyViewController.swift
//  Runner
//
//  Created by ☁️WillJun_Cho on 17/01/2018.
//  Copyright © 2018 ☁️WillJun_Cho. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    let MyTableView: UITableView = UITableView.init(frame: CGRect.zero, style: .plain)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addTableViewAction()
    }
    
    func addTableViewAction() {
        MyTableView.dataSource = self
        MyTableView.delegate = self
        MyTableView.backgroundColor = .white
        MyTableView.isScrollEnabled = false
        MyTableView.register(UINib(nibName: String(describing: MyTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MyTableViewCell.self))
        self.view.addSubview(MyTableView)
        
        MyTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
    }

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
        
        return cell
    }
    
    
}
