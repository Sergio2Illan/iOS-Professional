//
//  CustomTableViewCell.swift
//  UITableViewCustomCellStoryboard
//
//  Created by Sergio Illan Illan on 8/9/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var dataName: UILabel!
    @IBOutlet weak var dataCity: UILabel!
    @IBOutlet weak var dataImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
