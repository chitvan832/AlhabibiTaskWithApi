//
//  User.swift
//  AlhabibiTaskWithApi
//
//  Created by Sierra 4 on 21/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable {
    var statusCode: Int?
    var msg: String?
    var profile: Profile?
    
    required init?(map: Map){
        statusCode <- map["status_code"]
        msg <- map["msg"]
        profile <- map["profile"]
    }
    
    func mapping(map: Map){
        statusCode <- map["status_code"]
        msg <- map["msg"]
        profile <- map["profile"]
    }
}


class Profile: Mappable {
    public var username: String?
    var phone: String?
    var city: String?
    var country: String?
    
    required init?(map: Map){
        username <- map["username"]
        phone <- map["phone"]
        city <- map["city"]
        country <- map ["country"]
    }
    
    func mapping(map: Map){
        username <- map["username"]
        phone <- map["phone"]
        city <- map["city"]
        country <- map ["country"]
    }
}
