//
//  SecondTableViewCell.swift
//  KursWalut
//
//  Created by Vlad Koval on 27.06.2021.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    @IBOutlet weak var midLabel: UILabel!
    @IBOutlet weak var effectiveLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
