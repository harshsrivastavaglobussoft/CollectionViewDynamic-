//
//  CollectionViewCell.swift
//  HuggingAutoLayout3
//
//  Created by Sumit Ghosh on 13/12/17.
//  Copyright © 2017 Sumit Ghosh. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet var textLabel: UILabel!
    @IBOutlet var backView: UIView!
    
    override var isSelected: Bool {
        didSet {
            self.layer.borderWidth = 3.0
            let color = UIColor (red: 77/255, green: 159/255, blue: 91/255, alpha: 1.0)
            self.layer.borderColor = isSelected ? color.cgColor : UIColor.clear.cgColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let screenWidth = self.bounds.size.width - 50
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        
        self.backView.addConstraint(NSLayoutConstraint(item: self.backView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.lessThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: screenWidth))
    }
    
}
