//
//  AddChannelVC.swift
//  Smack
//
//  Created by Eli Armstrong on 9/28/18.
//  Copyright © 2018 Eli Armstrong. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    // Outlets
    @IBOutlet weak var NameTxt: UITextField!
    @IBOutlet weak var chanDesc: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func createChannelPressed(_ sender: Any) {
        guard let channelName = NameTxt.text, NameTxt.text != "" else {return}
        guard  let channelDesc = chanDesc.text else {return}
        
        SocketService.instance.addChannel(channelName: channelName, channelDescription: channelDesc) { (success) in
            if success{
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func closeModalPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupView(){
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
        NameTxt.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedString.Key.foregroundColor: SMACK_PURPLE_PLACE_HOLDER])
        
        chanDesc.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedString.Key.foregroundColor: SMACK_PURPLE_PLACE_HOLDER])
    }
    

    @objc func closeTap(_ recongnizer: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
}
