//
//  ArticlesDataManager.swift
//  Publisher_eric
//
//  Created by 唐紹桓 on 2020/11/20.
//

import UIKit

class ArticlesDataManager {
    
    static let shared = ArticlesDataManager()
    
    private init() {}
    
    let firebaseManager = FirebaseManager.shared
    
    // 所有文章資料，TableView 將依照它顯示
    
    var articlesDatas: [ArticlesData] = []
    
    var categorys: [String:UIColor] = [:]
    
    // 讀取 firebase 的資料
    
    func reloadData(handle: @escaping () -> Void) {
        
        firebaseManager.read { [weak self] result in
            
            // 依照時間排序
            self?.articlesDatas = result.sorted(by: { (first, second) -> Bool in
                
                print("firse data time :\(first.createdTime), second data time :\(second.createdTime)")
                
                return first.createdTime > second.createdTime
            })
            
            handle()
        }
    }
    
    // 新增資料到 firebase
    
    func addData(title: String, content: String, category: String) {
        
        let doc = firebaseManager.collection.document()
        
        let data: [String: Any] = [
            "author": [
                "email": "erictang0212@gmail.com",
                "id": "erictang0212",
                "name": "唐紹桓"
            ],
            "title": title,
            "content": content,
            "createdTime": firebaseManager.timeStamp,
            "id": doc.documentID,
            "category": category
        ]
        
        doc.setData(data)
    }
}
