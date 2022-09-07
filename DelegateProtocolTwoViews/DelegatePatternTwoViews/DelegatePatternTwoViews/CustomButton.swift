//
//  CustomButton.swift
//  DelegatePatternTwoViews
//
//  Created by Sergio Illan Illan on 7/9/22.
//

import UIKit

class CustomButton: UIButton {
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 18
        self.layer.masksToBounds = true
        self.backgroundColor = .systemBlue
        self.tintColor = .white
        setTitle("Enviar", for: .normal)
    }
    
}
