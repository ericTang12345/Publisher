//
//  PublishArticleViewController.swift
//  Publisher_eric
//
//  Created by 唐紹桓 on 2020/11/20.
//

import UIKit

class PublishArticleViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var categoryTextField: UITextField!
    
    @IBOutlet weak var postButton: UIButton! {
        didSet {
            
            postButton.layer.borderWidth = 0.5
            
            postButton.layer.borderColor = UIColor.lightGray.cgColor
            
            postButton.layer.cornerRadius = postButton.frame.width * 0.01
        }
    }
    
    
    @IBOutlet weak var contentTextView: UITextView! {
        
        didSet {
            
            contentTextView.layer.borderWidth = 0.5
            
            contentTextView.layer.borderColor = UIColor.lightGray.cgColor
            
            contentTextView.layer.cornerRadius = contentTextView.frame.width * 0.01
        }
    }
    
    let articlesDataManager = ArticlesDataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func post(_ sender: UIButton) {
        
        guard let title = titleTextField.text,
              let content = contentTextView.text,
              let category = categoryTextField.text
        else {
            return
        }
        
        ArticlesDataManager.shared.addData(title: title, content: content, category: category)
        
        navigationController?.popViewController(animated: true)
    }
    
}
