//
//  Alert.swift
//  Teeshan
//
//  Created by NITS Mac2 on 20/04/17.
//  Copyright © 2017 NITS Mac2. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class Alert
{
    internal static var alertMessageController:UIAlertController!
    
    /// To display alert message
    ///
    /// - Parameters:
    ///   - titleMessage: Used to show title
    ///   - alertMsg: Used to show message
    internal static func disPlayAlertMessage(titleMessage:String, alertMsg:String)
    {
        Alert.alertMessageController = UIAlertController(title: titleMessage, message:
            alertMsg, preferredStyle: UIAlertControllerStyle.alert)
        
        Alert.alertMessageController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
        if let controller = UIApplication.shared.keyWindow?.rootViewController?.presentedViewController {
            controller.present(Alert.alertMessageController, animated: true, completion: nil)
        }
        else{
            UIApplication.shared.delegate?.window!!.rootViewController?.present(Alert.alertMessageController, animated: true, completion: nil)
        }
        return
    }
     internal static func windowHeight() -> CGFloat? {
        return UIScreen.main.bounds.size.height
    }
     internal static func windowWidth() -> CGFloat {
        return UIScreen.main.bounds.size.width
    }
    /// To display an alert view with title and message
    ///
    /// - Parameters:
    ///   - titleMessage: Used to show the title
    ///   - alertMsg: Used to show the message
    ///   - dataReceived: Data which is received
    internal static func disPlayAlertMessage(titleMessage:String, alertMsg:String, dataReceived: ((String)->Void)?)
    {
        Alert.alertMessageController = UIAlertController(title: titleMessage, message:
            alertMsg, preferredStyle: UIAlertControllerStyle.alert)
        
        
        let saveAction = UIAlertAction(title: "Ok", style: .default, handler: {
            alert -> Void in
            
            let firstTextField = Alert.alertMessageController.textFields![0] as UITextField
            
            if let callback = dataReceived {
                callback(firstTextField.text!)
            }
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
            
        })
        
        
        Alert.alertMessageController.addTextField { (textField : UITextField!) -> Void in
            //textField.placeholder = "Enter your Email"
        }
        
        Alert.alertMessageController.addAction(saveAction)
        Alert.alertMessageController.addAction(cancelAction)
        
        if let controller = UIApplication.shared.keyWindow?.rootViewController?.presentedViewController {
            controller.present(Alert.alertMessageController, animated: true, completion: nil)
        }
        else{
            UIApplication.shared.delegate?.window!!.rootViewController?.present(Alert.alertMessageController, animated: true, completion: nil)
        }
        return
    }
    
    class func addLoader() {
        
        let activityData = ActivityData()
        NVActivityIndicatorView.DEFAULT_TYPE = .ballClipRotateMultiple
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
        }
    }
    
    class func removeLoader(){
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
        }
    }
}
