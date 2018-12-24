//
//  Constants.swift
//  LiveSell
//
//  Created by Dipanjan on 6/1/18.
//  Copyright © 2018 Aradhana Ray. All rights reserved.
//

import Foundation
struct Constants {
    
    static let IP: String = "111.93.169.90"
    static let twitch_client_id = "30pqvtzqyxad5qvjlxbxc674kesrv"
   // static let BASEAPIURL: String = "https://liveshop.runmobileapps.com/"
   // static let BASEURL: String = "https://liveshop.runmobileapps.com/"
    static let BASEAPIURL: String = "https://liveshop.liveshopinc.com/"
    static let BASEURL: String = "https://liveshop.liveshopinc.com/"
   
    static let IMAGEBASE:String = "https://res.cloudinary.com/www-marketstreet64-com/image/upload/"
    // static let BASEAPIURL: String = "http://runmobileapps.com/lea/"
    
   // static let twilioSID = "AC5205fb44d272955da6fcaab63ca3eedc"
   // static let twilioSecret = "7a560b69d93b9435d9a79337cff2b30b"
  //  static let twiliofromNumber = "+61476855965".changePlusTo2B
    
  //  static let twiliobaseurl = "https://\(twilioSID):\(twilioSecret)@api.twilio.com/2010-04-01/Accounts/\(twilioSID)/SMS/Messages.json"
    
    static func BASEURL(bMethodName: String) -> String
    {
        return "http://\(IP)/team1/Coupon/webservice/\(bMethodName)"
    }
    
    internal static func nullToNil(value : AnyObject?) -> AnyObject? {
        if value is NSNull {
            let str :String! = ""
            return str as AnyObject
        } else {
            return value
        }
    }
    
    
}
