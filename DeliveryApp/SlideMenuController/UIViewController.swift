//
//  UIViewControllerExtension.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/19/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setNavigationBarItem() {
        self.addLeftBarButtonWithImage(UIImage(named: "top-butt-menu")!)
       self.slideMenuController()?.removeLeftGestures()
       self.slideMenuController()?.addLeftGestures()
      
    }
    func setHomeNavigationBarItem() {
        self.addLeftBarButtonWithImage(UIImage(named: "top-butt-menu")!)
      //  self.addRightBarButtonWithImage(UIImage(named: "top-butt-menu")!)
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.addLeftGestures()
       // self.navigationItem.title = "Home"
    }
    func setBookigNavigationBarItem() {
        self.addLeftBarButtonWithImage(UIImage(named: "top-butt-menu")!)
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.addLeftGestures()
        self.navigationItem.title = "My Booking"
    }
    func setNotificationNavigationBarItem() {
        self.addLeftBarButtonWithImage(UIImage(named: "top-butt-menu")!)
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.addLeftGestures()
        self.navigationItem.title = "Notifications"
    }
    func setContactUSNavigationBarItem() {
        self.addLeftBarButtonWithImage(UIImage(named: "top-butt-menu")!)
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.addLeftGestures()
        self.navigationItem.title = "Contact Us"
    }
    func removeNavigationBarItem() {
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
        self.slideMenuController()?.removeLeftGestures()
  
    }
    func setAccountNavigationBarItem() {
        self.addLeftBarButtonWithImage(UIImage(named: "top-butt-menu")!)
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.addLeftGestures()
        self.navigationItem.title = "Account"
    }
    func setPaymentNavigationBarItem() {
        self.addLeftBarButtonWithImage(UIImage(named: "top-butt-menu")!)
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.addLeftGestures()
        self.navigationItem.title = "Payment"
    }
}
