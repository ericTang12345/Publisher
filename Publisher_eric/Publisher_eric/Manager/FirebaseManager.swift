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
    
    func listen(handle: @escaping () -> Void) {
        
        collection.addSnapshotListener { querySnapshot, error in
            
            guard querySnapshot != nil else {

                print("Error fetching collection: ", error?.localizedDescription ?? "")
                
                return
            }
            
            handle()
        }
    }
    
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
    
    func readTimestamp(timestamp: Any) -> Date {
        
        guard let timestamp = timestamp as? Timestamp else {
            print("轉換時間戳記失敗")
            return Date()
        }
        
        return timestamp.dateValue()
    }
    
    
    
}
