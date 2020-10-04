//
//  ViewController.swift
//  CollectionView
//
//  Created by Rodrigo Leme on 30/09/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrayDogs = [Dog]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        arrayDogs.append(Dog(name: "Dogito", breed: "SRD", age: 4))
        arrayDogs.append(Dog(name: "Denis", breed: "Bulldog", age: 3))
        arrayDogs.append(Dog(name: "Madruguinha", breed: "Doberman", age: 2))
        arrayDogs.append(Dog(name: "Ice", breed: "Labrador", age: 2))
        arrayDogs.append(Dog(name: "Barbudi", breed: "SRD", age: 4))
        arrayDogs.append(Dog(name: "Cora", breed: "Bulldog", age: 3))
        arrayDogs.append(Dog(name: "Bruce", breed: "Doberman", age: 2))
        arrayDogs.append(Dog(name: "Fire", breed: "Labrador", age: 2))
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayDogs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(arrayDogs[indexPath.row].name)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DogCollectionCell", for: indexPath) as! DogCollectionCell
        
        cell.setup(catiorro: arrayDogs[indexPath.row])
        
        return cell
    }
    
    
}

