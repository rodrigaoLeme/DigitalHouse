//
//  ViewController.swift
//  Exercicio04
//
//  Created by Rodrigo Leme on 04/10/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var clvList: UICollectionView!
    var arrayNames = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clvList.delegate = self
        clvList.dataSource = self
        
        for n in 1 ... 20 {
            arrayNames.append("Name \(n)")
        }
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        arrayNames.remove(at: indexPath.row)
        collectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "name", for: indexPath) as! NameCollectionViewCell
        
        cell.setUp(name: arrayNames[indexPath.row])
        //cell.backgroundColor = UIColor.lightGray
        
        return cell
    }
    
    
}
