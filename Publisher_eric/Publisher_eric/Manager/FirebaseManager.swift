//
//  FirebaseManager.swift
//  Publisher_eric
//
//  Created by 唐紹桓 on 2020/11/20.
//

import Foundation
import Firebase

class FirebaseManager {
    
    static let shared = FirebaseManager()
    
    let db = Firestore.firestore()
    
    var collection: CollectionReference {
        
        return db.collection("articles")
    }
    
    var timeStamp: Timestamp {
        
        return Firebase.Timestamp()
    }
    
    private init() {}
    
    // 只負責監聽是否有新的資料，透過 closure 去做後續的事情。
    
    func listen(handle: @escaping () -> Void) {
        
        collection.addSnapshotListener { querySnapshot, error in
            
            guard querySnapshot != nil else {

                print("Error fetching collection: ", error?.localizedDescription ?? "")
                
                return
            }
            
            handle()
        }
    }
    
    // 讀取所有資料，資料會放在 closure 裡面。
    
    func read(handle: @escaping ([ArticlesData]) -> Void) {
        
        collection.getDocuments { (querySnapshot, error) in
            
            if error != nil {
                print("Error to read firebase :", error?.localizedDescription ?? "")
            }
            
            if let querySnapshot = querySnapshot {
                
                let articlesDatas = querySnapshot.documents.map { (querySnapshot) -> ArticlesData in
                    
                    return ArticlesData.init(data: querySnapshot.data())
                }
                
                handle(articlesDatas)
            }
        }
    }
    
    // 轉換時間戳記
    
    func readTimestamp(timestamp: Any) -> Date {
        
        guard let timestamp = timestamp as? Timestamp else {
            
            print("轉換時間戳記失敗")
            
            return Date()
        }
        
        return timestamp.dateValue()
    }
    
    
    
}
