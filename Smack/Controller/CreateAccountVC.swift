//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Eli Armstrong on 8/24/18.
//  Copyright © 2018 Eli Armstrong. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
}
