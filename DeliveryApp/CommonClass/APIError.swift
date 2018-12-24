//
//  APIError.swift
//  Teeshan
//
//  Created by Manab Kumar Mal on 09/05/17.
//  Copyright © 2017 NITS Mac2. All rights reserved.
//

import Foundation
import ObjectMapper


protocol DentalErrorProtocol: Error {
    
    var title: String { get }
    var description: String { get }
    var code: Int { get }
}

struct DDSError: DentalErrorProtocol
{
    var title: String
    var description: String
    var code: Int
    
    init(title: String?, description: String, code: Int)
    {
        self.title = title ?? "Error"
        self.description = description
        self.code = code
    }
}

public class APIError: Mappable {
    
    var error: String = ""
    var success: Bool?
    var success_str : String = ""
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        
        error <- map["message"]
        success <- map["success"]
        success_str <- map["result"]
        if success == nil{
            success <- map["result"]
            
            if success == nil {
                
                if success_str == "TRUE" {
                    success = true
                }else{
                    success = false
                }
            }
        }
    }
    
    func getError() -> String?
    {
        let error:String = (self.error.characters.count) == 0 ? "Please try again" : self.error
        return error
    }
    
    func getSuccess() -> Bool? {
        return self.success
    }
    
}

