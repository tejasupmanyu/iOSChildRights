//
//  ActDetailsTableViewCell.swift
//  HackathonPrototype
//
//  Created by Tejas Upmanyu on 25/03/17.
//  Copyright © 2017 VisionArray. All rights reserved.
//

import UIKit

class ActDetailsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var CellHeaderLabel: UILabel!
    
    @IBOutlet weak var CellTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
