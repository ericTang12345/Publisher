//
//  HomeTableViewCell.swift
//  Publisher_eric
//
//  Created by 唐紹桓 on 2020/11/20.
//

import UIKit

protocol HomeTableViewCellDelegate: AnyObject {
    
    func reload(cell: UITableViewCell)
}

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: LabelPadding! {
        
        didSet {
                
            categoryLabel.layer.cornerRadius = categoryLabel.frame.width * 0.075
            
            categoryLabel.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var createdTimeLabel: UILabel!
    
    weak var delegate: HomeTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setup(data: ArticlesData) {
        
        titleLabel.text = data.title
        
        authorLabel.text = data.author.name
        
        categoryLabel.text = data.category
        
        ColorDataManager.shared.readData(category: data.category) { (color) in
        
            self.categoryLabel.textColor = color
        }
        
        contentLabel.text = data.content
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy.MM.dd hh:mm"
        
        createdTimeLabel.text = dateFormatter.string(from: data.createdTime)
    }
}
