//
//  FirebaseData.swift
//  Publisher_eric
//
//  Created by 唐紹桓 on 2020/11/20.
//

import Foundation

struct ArticlesData {
    
    let author: Author
    
    let title: String
    
    let content: String
    
    let createdTime: Date
    
    let id: String
    
    let category: String
}

extension ArticlesData {
    
    // 讀取回來的資料轉換
    
    init (data: [String:Any]) {
        
        self.title = data["title"] as? String ?? ""
        
        self.content = data["content"] as? String ?? ""
        
        self.createdTime = FirebaseManager.shared.readTimestamp(timestamp: data["createdTime"]!)
        
        self.category = data["category"] as? String ?? ""
        
        self.id = data["id"] as? String ?? ""
        
        let authorData = data["author"] as? [String: String] ?? ["":""]
        
        self.author = Author(email: authorData["email"] ?? "",
                             id: authorData["id"] ?? "",
                             name: authorData["name"] ?? "")
    }
}

struct Author {
    
    let email: String
    
    let id: String
    
    let name: String
}
