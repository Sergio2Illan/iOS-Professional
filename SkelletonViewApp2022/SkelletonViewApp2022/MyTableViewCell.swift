//
//  MyTableViewCell.swift
//  SkelletonViewApp2022
//
//  Created by Sergio Illan Illan on 13/9/22.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    static let id = "cell"

    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var myText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
