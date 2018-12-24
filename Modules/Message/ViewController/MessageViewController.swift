//
//  MessageViewController.swift
//  DeliveryApp
//
//  Created by Aradhana Ray on 24/07/18.
//  Copyright © 2018 Aradhana Ray. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    
    @IBOutlet weak var tblMsg: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let nib = UINib(nibName: "MessageTableViewCell", bundle: Bundle.main)
        tblMsg.register(nib, forCellReuseIdentifier: "MessageTableViewCell")
        // Do any additional setup after loading the view.
        tblMsg.estimatedRowHeight = 90
        tblMsg.rowHeight = UITableViewAutomaticDimension
        
        
    }

    
    @IBAction func menuAction(_ sender: Any) {
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageTableViewCell") as! MessageTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let msgdetail = MessageDetailViewController()
        self.navigationController?.pushViewController(msgdetail, animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
