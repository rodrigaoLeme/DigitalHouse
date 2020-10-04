//
//  NameCollectionViewCell.swift
//  Exercicio04
//
//  Created by Rodrigo Leme on 04/10/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import UIKit

class NameCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var viwFundo: UIView!
    
    func setUp(name: String) {
        lblName.text = name
        viwFundo.backgroundColor = UIColor.lightGray
    }
}
