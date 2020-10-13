//
//  PhotoCollectionViewCell.swift
//  DesafioDatePickerView
//
//  Created by Rodrigo Leme on 13/10/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgPhoto: UIImageView!
    
    
    func setup(hotel: String) {
        imgPhoto.image = UIImage(named: hotel)
    }
}
