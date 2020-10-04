//
//  DogCollectionCell.swift
//  CollectionView
//
//  Created by Rodrigo Leme on 30/09/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import UIKit

class DogCollectionCell: UICollectionViewCell {
    @IBOutlet weak var lblNome: UILabel!
    
    func setup(catiorro: Dog) {
        lblNome.text = catiorro.name
    }
}
