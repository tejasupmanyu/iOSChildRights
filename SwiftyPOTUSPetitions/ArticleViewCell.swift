//
//  ArticleViewCell.swift
//  HackathonPrototype
//
//  Created by Tejas Upmanyu on 29/03/17.
//  Copyright © 2017 VisionArray. All rights reserved.
//

import UIKit

class ArticleViewCell: UITableViewCell {

    
    @IBOutlet weak var ThumbNail: UIImageView!
    
    @IBOutlet weak var NewsTitle: UILabel!
    
    
    @IBOutlet weak var NewsDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
