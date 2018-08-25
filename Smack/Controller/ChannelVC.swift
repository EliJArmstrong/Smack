//
//  ChannelVC.swift
//  Smack
//
//  Created by Eli Armstrong on 8/24/18.
//  Copyright © 2018 Eli Armstrong. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    // Outlets
    @IBOutlet weak var loginBtn: UIButton!
    
    // This make it so that an exit segue (the exit button at the top of view controllers) will be able to use this func as a destination.
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This will cause all but 60 pixels to reveal of this view controller
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width  - 60;
        //print(self.view.frame.size.width  - 60)
    }

    @IBAction func LoginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
}
