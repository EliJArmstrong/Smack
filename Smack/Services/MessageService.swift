//
//  MessageService.swift
//  Smack
//
//  Created by Eli Armstrong on 9/28/18.
//  Copyright © 2018 Eli Armstrong. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class MessageService{
    
    static let instance = MessageService()
    
    var channels = [Channel]()
    
    
    func findAllChannels(completion: @escaping CompletionHandler){
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil{
                guard let data = response.data else {return}
                
                // Swift 4 way to get json note the Channel model has to conform to the naming conventions of the data being read in from the server.
                do{
                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
                }catch let error {
                    debugPrint(error as Any)
                }
                
                print(self.channels)
                
                // Swifty json way
//                do{
//                    if let json = try JSON(data: data).array {
//                        for item in json{
//                            let name = item["name"].stringValue
//                            let channelDescription = item["description"].stringValue
//                            let id = item["_id"].stringValue
//
//                            let channel = Channel(channelTitle: name, channelDescription: channelDescription, id: id)
//
//                            self.channels.append(channel)
//                        }
//                        completion(true)
//                    }
//                } catch{
//                    debugPrint("json error")
//                }
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
