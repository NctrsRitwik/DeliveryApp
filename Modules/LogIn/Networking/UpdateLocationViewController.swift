//
//  UpdateLocationViewController.swift
//  Calibrr
//
//  Created by Aradhana Ray on 12/04/18.
//  Copyright © 2018 NCRTS. All rights reserved.
//

import UIKit
import MapKit


class UpdateLocationViewController: UIViewController , CLLocationManagerDelegate{
  static var userId =  UserDefaults.standard.value(forKey: "user_id") ?? "" //UserDefaults.standard.string(forKey: "user_id")
  static var timer = Timer()
  static var BASEURL:String  = "http://runmobileapps.com/calibrr/api/v1/"
 // static var mysession = URLSession.shared
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    static func startUpdateLocation() {
       // updateLocationApi()
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 20.0, target: self, selector: #selector(self.updateLocationApi), userInfo: nil, repeats: true)
        
       
    }
    
    
   static func stopUpdateLocation() {
        timer.invalidate()
    }
    
  
    static func updateLocationApi() {
        
        let locManager = CLLocationManager()
        //var currentLocation = CLLocation ()
        
        
        //locManager.requestWhenInUseAuthorization()
        
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            
            guard let currentLocation = locManager.location else {return}
            //print(currentLocation.coordinate.latitude)
           // print(currentLocation.coordinate.longitude)
            
            let lat = String(currentLocation.coordinate.latitude)
            let lang = String(currentLocation.coordinate.longitude)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.lat = lat
            appDelegate.lang = lang
            let mysession = URLSession.shared
            let url_str = Constants.BASEAPIURL + "updatelocationinfo"
            var urlRQST = URLRequest(url: URL(string: url_str)!)
            print("location update url",urlRQST)
            print("lat ==>", lat)
            print("lang ==>", lang)
            print("JWTTOKEN ==>", userId)
            urlRQST.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRQST.setValue(userId as! String , forHTTPHeaderField: "JWTTOKEN")
            urlRQST.httpMethod = "POST"
            let bodyTOpost = ["latitude" : lat , "longitude" : lang]
            do {
                let jsonBody = try JSONSerialization.data(withJSONObject: bodyTOpost, options: JSONSerialization.WritingOptions.prettyPrinted)
                urlRQST.httpBody = jsonBody
                let task1 = mysession.dataTask(with: urlRQST, completionHandler: { (data, response, error) in
                    if error != nil {
                        print("posting error =>>",error!)
                    }
                    else{
                        do {
                            let jsonoutput1 = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                            print(jsonoutput1)
                        }
                        catch let err{
                            print("output Serialization error ==>",err)
                        }
                    }
                })
                //task1.priority = 0.5
                task1.resume()
            }
            catch let err{
                print("post Serialization error ==>",err)
            }
            
            
        }
    }

}
