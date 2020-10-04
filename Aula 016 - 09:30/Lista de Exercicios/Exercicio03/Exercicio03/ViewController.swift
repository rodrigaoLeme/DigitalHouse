//
//  ViewController.swift
//  Exercicio03
//
//  Created by Rodrigo Leme on 04/10/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var clvCar: UICollectionView!
    
    var carsArray = [Cars]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clvCar.delegate = self
        clvCar.dataSource = self
        
        for n in 0 ... 9 {
            carsArray.append(Cars(name: "Car \(n)", image: "carro\(n).jpg"))
        }
        
        title = "Cars List"
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let carDetail = UIStoryboard(name: "CarDetail", bundle: nil).instantiateInitialViewController() as? CarDetailViewController {
            
            //carDetail.imgCar.image = UIImage(named: carsArray[indexPath.row].image)
            
            carDetail.carName = carsArray[indexPath.row].image
            carDetail.title = carsArray[indexPath.row].name
            
            navigationController?.pushViewController(carDetail, animated: true)
            
            
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        carsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarCollectionViewCell", for: indexPath) as! CarCollectionViewCell
        
        cell.setUp(car: carsArray[indexPath.row])
        
        return cell
    }
    
    
}
