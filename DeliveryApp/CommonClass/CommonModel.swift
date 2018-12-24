//
//  CommonModel.swift
//  Minifm
//
//  Created by Dipanjan on 3/20/18.
//  Copyright © 2018 Aradhana Ray. All rights reserved.
//

import Foundation
import ObjectMapper

class CommonModel: Mappable
    
{
    var msg: String!
    var status : String!
    var success: Bool!
    var id : Int!
    public required init?(map: Map)
    {
        
    }
    
    public func mapping(map: Map)
    {
        msg <- map["message"]
        status <- map["response"]
        success <- map["success"]
        id <- map["id"]
        //phone <- map["Details.phone"]
        //  profile_image <- map["UserDetails.profile_image"]       
    }
}
