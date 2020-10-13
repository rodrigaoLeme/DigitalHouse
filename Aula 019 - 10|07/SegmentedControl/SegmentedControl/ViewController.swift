//
//  ViewController.swift
//  SegmentedControl
//
//  Created by Rodrigo Leme on 07/10/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import UIKit

enum SchoolRule {
    static let student = 0
    static let professor = 1
    static let director = 2
}

class ViewController: UIViewController {
    @IBOutlet weak var segmentedControlSchoolRules: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func changedSegmentedControlSchoolRules(_ sender: UISegmentedControl) {
        print(segmentedControlSchoolRules.selectedSegmentIndex)
    }
    
    @IBAction func actionShow(_ sender: UIButton) {
        switch segmentedControlSchoolRules.selectedSegmentIndex {
        case SchoolRule.student:
            print("Estudante")
        case SchoolRule.professor:
            print("Professor")
        case SchoolRule.director:
            print("Diretor")
        default:
            print("Desconhecido")
        }
    }
}

