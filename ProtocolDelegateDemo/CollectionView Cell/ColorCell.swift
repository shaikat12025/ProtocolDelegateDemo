//
//  ColorCell.swift
//  ProtocolDelegateDemo
//
//  Created by sadidur rahman on 1/2/20.
//  Copyright © 2020 pathao. All rights reserved.
//

import UIKit

class ColorCell: UICollectionViewCell {
    @IBOutlet weak var colorView: UIView!
    
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
        colorView.layer.cornerRadius = 4.0
    }
    
    func showSelection(){
        colorView.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        colorView.layer.borderWidth = 2
    }
    
    func hideSelection(){
        colorView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        colorView.layer.borderWidth = 0
    }
}
