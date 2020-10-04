//
//  CarDetailViewController.swift
//  Exercicio03
//
//  Created by Rodrigo Leme on 04/10/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import UIKit

class CarDetailViewController: UIViewController {

    @IBOutlet weak var imgCar: UIImageView!
    
    var carName: String = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        imgCar.image = UIImage(named: carName)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
