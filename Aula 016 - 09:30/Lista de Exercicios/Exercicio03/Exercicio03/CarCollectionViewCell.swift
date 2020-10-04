//
//  CarCollectionViewCell.swift
//  Exercicio03
//
//  Created by Rodrigo Leme on 04/10/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import UIKit

class CarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgCar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    func setUp(car: Cars) {
        lblName.text = car.name
        imgCar.image = UIImage(named: car.image)
    }
}
