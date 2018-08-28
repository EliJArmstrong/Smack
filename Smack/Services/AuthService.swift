//
//  AuthService.swift
//  Smack
//
//  Created by Eli Armstrong on 8/28/18.
//  Copyright © 2018 Eli Armstrong. All rights reserved.
//

import Foundation
import Alamofire


class AuthService{
    static let instance = AuthService()
    
    // The userDefults class is a var of persistent data for user info. ie: username, tokens, Email.
    // So the end user will not have to login evertime the app lunches. passwords should not be stored here though due to this method not being the
    // most secured.
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn: Bool{
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set{
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToke: String{
        get{
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set{
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail:String{
        get{
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set{
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler){
        
        let lowerCaseEmail = email.lowercased()
        
        let header = [
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        let body: [String : Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            if response.result.error == nil{
                completion(true)
            } else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
