//
//  SignUpRequest.swift
//  DeliveryApp
//
//  Created by Amit Chakraborty on 02/08/2018.
//  Copyright © 2018 Aradhana Ray. All rights reserved.
//

import Foundation
import Alamofire


class SignUpRequest: APIRequest
{
    public var path: String {
        return "forgot_password"
    }
    public var header: [String : String]{
        
        return ["Content-Type": "application/json"]
    }
    public var method: HTTPMethod {
        return .post
    }
    //deviceType, language_id, deviceUniqueCode, first_name, last_name, email, phone, username, password, transport_type_id, year_model, licence_plate, vehicle_color, profile_image, driving_licence_file, insurance_file
    public var parameters: [String: Any] {
        return ["deviceType": deviceType,"language_id": language_id,"deviceUniqueCode": deviceUniqueCode,"first_name": first_name,"email":email,"last_name":last_name,"phone":phone,"username":username,"password":password,"transport_type_id":transport_type_id,"year_model":year_model,"licence_plate":licence_plate,"vehicle_color":vehicle_color,"profile_image":profile_image,"driving_licence_file":driving_licence_file,"insurance_file":insurance_file]
    }
    
    public var isAuthorized: Bool {
        return false
    }
    
    public var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    private let deviceType: String
    private let language_id: String
    private let deviceUniqueCode: String
    private let first_name: String
    private let email:String
    private let last_name:String
    private let phone:String
    private let username:String
    private let password:String
    private let transport_type_id:String
    private let year_model:String
    private let licence_plate:String
    private let vehicle_color:String
    private let profile_image:String
    private let driving_licence_file:String
    private let insurance_file:String
    init(deviceType: String,language_id: String,deviceUniqueCode: String,first_name: String,email:String,last_name:String,phone:String,username:String,password:String,transport_type_id:String,year_model:String,licence_plate:String,vehicle_color:String,profile_image:String,driving_licence_file:String,insurance_file:String) {
        
        self.deviceType = deviceType
        self.language_id = language_id
        self.deviceUniqueCode = deviceUniqueCode
        self.first_name = first_name
        self.email = email
        self.last_name = last_name
        self.phone = phone
        self.username = username
        self.password = password
        self.transport_type_id = transport_type_id
        self.year_model = year_model
        self.licence_plate = licence_plate
        self.vehicle_color = vehicle_color
        self.profile_image = profile_image
        self.driving_licence_file = driving_licence_file
        self.insurance_file = insurance_file
    }
}
