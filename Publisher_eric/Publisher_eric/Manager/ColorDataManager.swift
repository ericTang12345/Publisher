//
//  ColorDataManager.swift
//  Publisher_eric
//
//  Created by 唐紹桓 on 2020/11/20.
//

import UIKit

class ColorDataManager {
    
    static let shared = ColorDataManager()
    
    private init() {}
    
    let firebaseManager = FirebaseManager.shared
    
    func readData(category: String, handle: @escaping (UIColor) -> Void) {
        
        firebaseManager.db.collection("category")
            .whereField("title", isEqualTo: category)
            .getDocuments { (querySnapshot, error) in
                
                if let querySnapshot = querySnapshot {
                    
                    for doc in querySnapshot.documents {
                        
                        let data = doc.data()
                        
                        if let hex = data["color"] as? String {
                            
                            handle(UIColor.init(hexaRGB: hex)!)
                        }
                    }
                }
            }
    }
    
    func saveColor(category: String) {
        
        let doc = firebaseManager.db.collection("category")
        
        let randomColor = UIColor.random()
        
        let hex = UIColor.colorToString(color: randomColor)
        
        doc.document(category).setData(["title": category, "color": hex])
        
    }
}
