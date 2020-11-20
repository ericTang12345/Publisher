//
//  HomeViewController.swift
//  Publisher_eric
//
//  Created by 唐紹桓 on 2020/11/20.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
    
        didSet {
            
            tableView.delegate = self
            
            tableView.dataSource = self
            
            let refreshControl = UIRefreshControl()
            
            let attributes = [NSAttributedString.Key.foregroundColor: UIColor.systemBlue]
            
            refreshControl.attributedTitle = NSAttributedString(string: "下拉刷新", attributes: attributes)
            
            refreshControl.tintColor = .black
            
            refreshControl.backgroundColor = .white
            
            refreshControl.addTarget(self, action: #selector(reloadView), for: .valueChanged)
            
            tableView.refreshControl = refreshControl
        }
    }
    
    let articlesDataManager = ArticlesDataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirebaseManager.shared.listen {
            
            self.reloadView()
        }
    }
    
    @objc func reloadView() {
    
        self.tableView.refreshControl?.attributedTitle = NSAttributedString(string: "正在刷新")
        
        articlesDataManager.reloadData {
            
            self.tableView.refreshControl?.attributedTitle = NSAttributedString(string: "刷新完畢")
            
            self.tableView.reloadData()
            
            self.tableView.refreshControl?.endRefreshing()
            
            self.tableView.refreshControl?.attributedTitle = NSAttributedString(string: "下拉刷新")
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articlesDataManager.articlesDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeTableViewCell
        
        let data = articlesDataManager.articlesDatas[indexPath.row]
        
        cell.setup(data: data)
        
        return cell
    }
}
