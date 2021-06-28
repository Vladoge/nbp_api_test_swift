//
//  MainTableViewCell.swift
//  KursWalut
//
//  Created by Vlad Koval on 24.06.2021.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var effectiveDateLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var midLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }

}
