//
//  CustomAlertMessage.swift
//  FLY
//
//  Created by NITS_Mac5 on 06/06/17.
//  Copyright © 2017 NATIT Solved Pvt Ltd. All rights reserved.
//

import UIKit

class CustomAlertMessage: UIViewController {
    
    var AlertmyView :UIView!
    var ComingStatusCode :NSString!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
          self.view.backgroundColor = UIColor.clear
          CustomeshowAlertMessage()
    }

    func CustomeshowAlertMessage ()
        
    {
        self.view.isUserInteractionEnabled=false
        
        let keyWindow = UIApplication.shared.keyWindow
        AlertmyView = UIView(frame: CGRect(x: 0, y: -70, width: (keyWindow?.frame.size.width)!, height: 0))
        AlertmyView.backgroundColor=UIColor.black
        keyWindow?.addSubview(AlertmyView)
        
        
        let  AlertmyLabel = UILabel(frame: CGRect(x: 10, y:10, width: AlertmyView.frame.size.width-20, height: 60))
        AlertmyLabel.textColor=UIColor.white
        AlertmyLabel.text="Error message show!";
        AlertmyLabel.textAlignment = .center
        AlertmyView.addSubview(AlertmyLabel)
        AlertmyLabel.font = UIFont .systemFont(ofSize: 15.0)
        AlertmyLabel.numberOfLines=3;
        AlertmyLabel.lineBreakMode = .byWordWrapping
        
        AlertmyLabel.text = ComingStatusCode as String?;
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
            
            self.AlertmyView.frame=CGRect(x:0, y: 0, width: self.AlertmyView.frame.size.width, height: 70)
        }, completion: nil)
        
        _ = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.DismissAlert), userInfo: nil, repeats: false);
    }
    
    @objc func DismissAlert() {
        
         UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
            
            self.AlertmyView.frame=CGRect(x:0, y: -70, width: self.AlertmyView.frame.size.width, height: 0)
            
         }, completion: nil)
        
        self.view.isUserInteractionEnabled=true
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
