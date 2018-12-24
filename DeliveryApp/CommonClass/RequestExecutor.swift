//
//  RequestExecutor.swift
//  Qupon_Business
//
//  Created by NITS_Mac5 on 19/07/17.
//  Copyright © 2017 NATIT Solved Pvt Ltd. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper


class RequestExecutor

{
    static func executeRequest<T: APIRequest, U: Mappable>(_ request: T,
                               completion: @escaping (_ error: Error?, _ result: U?) -> Void){
        
        let headers = request.header
        let url = URL(string: request.baseURL + request.path)!
        
        print(request.method)
        print("parameter===========",request.parameters)
        print(request.encoding)
        print(url)
        print(headers)
        
        Alamofire.request(url,
                          method:request.method,
                          parameters: request.parameters.isEmpty ? nil : request.parameters,
                          encoding: request.encoding,
                          headers: headers).responseJSON(queue: DispatchQueue.main, options: JSONSerialization.ReadingOptions.allowFragments, completionHandler:
                            {(response) in
                                print("Response is",response)
                                
                                
                                if response != nil && response.result.isSuccess
                                {
                                    if let APISuccess = Mapper<APIError>().map(JSON: response.result.value as! [String : Any])
                                    {
                                        if APISuccess.getSuccess() == true
                                         {
                                            if let object = Mapper<U>().map(JSON: response.result.value as! [String : Any])
                                            {
                                                
                                                completion(nil, object)
                                            }
                                            else
                                            {
                                              //  completion(response.error, nil)
                                                
                                                let msg:String = APISuccess.getError()!
                                                let err = DDSError(title: "APIError", description: msg, code: 1001)
                                                completion(err,nil)
                                            }
                                        }
                                        else
                                        {
                                            let msg:String = APISuccess.getError()!
                                            let err = DDSError(title: "APIError", description: msg, code: 1001)
                                            completion(err,nil)
                                        }
                                    }
                                    else
                                    {
                                       // completion(response.error, nil)
                                        
                                        let Static_httpstatus:Int!
                                        Static_httpstatus=89000
                                        let err = DDSError(title: "APIError", description: "Please try again", code: Static_httpstatus!)
                                        
                                        completion(err,nil)
                                    }
                                }
                                else{
                                    
                                    let Static_httpstatus:Int!
                                    Static_httpstatus=89000
                                    let err = DDSError(title: "APIError", description: "Please try again", code: Static_httpstatus!)
                                    
                                    completion(err,nil)
                                }
                          })
    }
    
   //
    // ======== From data
  /*  static func uploadRequest<T: APIRequest, U: Mappable>(_ request: T,
                                                          completion: @escaping ( error: Error?,  result: U?) -> Void) {
        
        
        let url = request.baseURL + request.path
        
        print(request.method)
        print(request.parameters)
        print(request.encoding)
        print(url)
        
        if InternetRechability.isConnectedToNetwork() == true {
            print("Internet connection OK")
            
            
            Alamofire.upload(multipartFormData:{ multipartFormData in
                
                for (key, value) in request.parameters
                {
                    if key.contains("image")
                    {
                        let img = value as? UIImage
                        
                        let imgData = UIImageJPEGRepresentation(img!, 0.5)!
                        
                        let randNum = arc4random() % (999999999 - 100000000) + 999999999; //create the random number.
                        let formatter = DateFormatter()
                        formatter.dateFormat = "yyyyMMddHHmmssSSS"
                        
                        let dateString = formatter.string(from: Date())
                        
                        let name = "SPro_" + dateString + "_\(randNum)" + ".jpg"
                        
                        multipartFormData.append(imgData, withName: key,fileName: name, mimeType: "image/jpg")
                    }
                    else
                    {
                        multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                    }
                }
            }, to:url)
            { (result) in
                switch result {
                case .success(let upload, , ):
                    
                    upload.uploadProgress(closure: { (progress) in
                        print("Upload Progress: \(progress.fractionCompleted)")
                    })
                    
                    upload.responseJSON { response in
                        if response.result.value != nil
                        {
                            if let APISuccess = Mapper<APIError>().map(JSON: response.result.value as! [String : Any])
                            {
                                if APISuccess.getSuccess() == "1"
                                {
                                    if let object = Mapper<U>().map(JSON: response.result.value as! [String : Any])
                                    {
                                        
                                        completion(nil, object)
                                    }
                                    else
                                    {
                                        completion(response.error, nil)
                                    }
                                }
                                else
                                {
                                    
                                    
                                    let msg:String = APISuccess.getError()!
                                    let err = DDSError(title: "APIError", description: msg, code: 1001)
                                    completion(err,nil)
                                }
                            }
                            else
                            {
                                
                                completion(response.error, nil)
                            }
                        }
                    }
                    
                case .failure(let encodingError):
                    print(encodingError)
                }
            }
            
        }
        else{
            
            print("Internet connection failed")
            NotificationCenter.default.post(name: .networkRechability, object:nil)
        }
    }*/
    //======
    
    
    
}
