//
//  Channel.swift
//  Smack
//
//  Created by Eli Armstrong on 9/28/18.
//  Copyright © 2018 Eli Armstrong. All rights reserved.
//

import Foundation

//
struct Channel{
    public private(set) var channelTitle: String!
    public private(set) var channelDescription: String!
    public private(set) var id: String!
}

// Would need to be this way if using swift 4 jason parsing 
//struct Channel : Decodable{
//    public private(set) var _id: String!
//    public private(set) var name: String!
//    public private(set) var description: String!
//    public private(set) var __v: Int!
//}
