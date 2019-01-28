//
//  ItemTableViewCell.swift
//  Homepwner
//
//  Created by Németh Bendegúz on 2018. 12. 12..
//  Copyright © 2018. Németh Bendegúz. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialNumberLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.nameLabel.adjustsFontForContentSizeCategory = true
        self.serialNumberLabel.adjustsFontForContentSizeCategory = true
        self.valueLabel.adjustsFontForContentSizeCategory = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
