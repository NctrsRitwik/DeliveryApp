//
//  APIRequest.swift
//  Teeshan
//
//  Created by Compote on 24.04.17.

//

import Alamofire

public protocol APIRequest {
    
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var isAuthorized: Bool { get }
    var parameters: [String: Any] { get }
    var encoding: ParameterEncoding { get }
    var header: [String:String] { get }
    
}

extension APIRequest {
    
    public var baseURL: String {
        return Constants.BASEAPIURL
    }
    
    public var path: String {
        return ""
    }
    
    public var method: HTTPMethod {
        return .get
    }
    
    public var parameters: [String: Any] {
        return [:]
    }
    
    public var isAuthorized: Bool {
        return true
    }
    
    public var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    public var header: [String: String] {
        return [:]
    }
}
