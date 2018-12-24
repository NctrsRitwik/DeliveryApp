//
//  Parser.swift
//  Teeshan
//
//  Created by NITS Mac2 on 20/04/17.

//

import Foundation
import Alamofire

class Parser
{
    
    //var parserCallBack : ((_ error : NSError?, _ dictData : NSDictionary) -> Void)?
    
    /// To parse a response which is comming from webservice
    ///
    /// - Parameter response: Parameter details
    /// - Returns: Return the response
    
    
    internal static func getDataDict(response:DataResponse<Any>, result: @escaping ((_ error : NSError?, _ dictData : NSDictionary) -> Void))
    {
        switch(response.result)
        {
        case .success(_):
            if response.result.value != nil{
                print("response : \(response.result.value)")
                
                let dictData:[String:AnyObject] = response.result.value as! [String : AnyObject]
                
                print("\(dictData)")
                let Ack:Int = dictData ["response"] as! Int
                if Ack == 1
                {
                    result(nil, dictData["data"] as! NSDictionary)
                    //parserCallBack(nil, dictData["data"] as! NSDictionary)
                }
            }
            break
            
        case .failure(_):
            
            print("Failure : \(response.result.error)")
           
            break
            
        }
    }
}
