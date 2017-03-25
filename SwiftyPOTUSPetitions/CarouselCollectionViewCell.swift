//
//  CarouselCollectionViewCell.swift
//  HackathonPrototype
//
//  Created by Tejas Upmanyu on 24/03/17.
//  Copyright © 2017 VisionArray. All rights reserved.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var cellBackground: UIImageView!
    
    @IBOutlet weak var cellLabel: UILabel!
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
    }
}
