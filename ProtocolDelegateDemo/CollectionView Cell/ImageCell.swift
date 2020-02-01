//
//  ImageCell.swift
//  ProtocolDelegateDemo
//
//  Created by sadidur rahman on 1/2/20.
//  Copyright © 2020 pathao. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    @IBOutlet var bgView: UIView!
    @IBOutlet weak var itemImageView: UIImageView!
    
    override var isSelected: Bool{
        willSet{
            super.isSelected = newValue
            if newValue
            {
                showSelection()
            }
            else
            {
                hideSelection()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bgView.layer.cornerRadius = 4.0
    }
    
    func showSelection() {
        bgView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        bgView.layer.borderWidth = 2
    }
    
    func hideSelection() {
        bgView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        bgView.layer.borderWidth = 0
    }
    
}
