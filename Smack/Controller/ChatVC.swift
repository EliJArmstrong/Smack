//
//  ChatVC.swift
//  Smack
//
//  Created by Eli Armstrong on 8/24/18.
//  Copyright © 2018 Eli Armstrong. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    // Outlets
    @IBOutlet weak var menuBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // This shows the rear controller when the button with three lines is touched.
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        // This cause the rear view to be shown with a pan gesture.
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        // This causes the front view to take the whole foreground when the chatVC is tapped.
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail { (success) in
                if success{
                    NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                }
            }
        }
        
        MessageService.instance.findAllChannels { (success) in
            if success {
                
            }
        }
    }

}
