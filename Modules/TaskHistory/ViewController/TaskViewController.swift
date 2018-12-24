//
//  TaskHistoryViewController.swift
//  DeliveryApp
//
//  Created by Aradhana Ray on 24/07/18.
//  Copyright © 2018 Aradhana Ray. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    @IBOutlet weak var tblVwMain: UITableView!
    @IBOutlet weak var btnAssigned: UIButton!
    @IBOutlet weak var btnPickedup: UIButton!
    
    @IBOutlet weak var btnIntransit: UIButton!
    
    @IBOutlet weak var btnDelivered: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        
        btnAssigned.isSelected = true
        btnAssigned.backgroundColor = UIColor.darkGray
       // btnAssigned.titleLabel?.textColor = UIColor.white
        btnPickedup.isSelected = false
        btnPickedup.backgroundColor = UIColor.clear
       // btnPickedup.titleLabel?.textColor = UIColor.darkGray
        btnIntransit.isSelected = false
        btnIntransit.backgroundColor = UIColor.clear
       // btnIntransit.titleLabel?.textColor = UIColor.darkGray
        btnDelivered.isSelected = false
        btnDelivered.backgroundColor = UIColor.clear
       // btnDelivered.titleLabel?.textColor = UIColor.darkGray
//        self.tblVw.tableFooterView = UIView(frame: CGRect.zero)
        let nib = UINib(nibName: "TaskTableViewCell", bundle: Bundle.main)
        tblVwMain.register(nib, forCellReuseIdentifier: "TaskTableViewCell")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnMenuAction(_ sender: Any) {
    }
    

    @IBAction func btnSearchAction(_ sender: Any) {
    }
    
    @IBAction func btnAssignedAction(_ sender: Any) {
        btnAssigned.isSelected = true
        btnAssigned.backgroundColor = UIColor.darkGray
        //btnAssigned.titleLabel?.textColor = UIColor.white
        btnPickedup.isSelected = false
        btnPickedup.backgroundColor = UIColor.clear
        //btnPickedup.titleLabel?.textColor = UIColor.darkGray
        btnIntransit.isSelected = false
        btnIntransit.backgroundColor = UIColor.clear
       // btnIntransit.titleLabel?.textColor = UIColor.darkGray
        btnDelivered.isSelected = false
        btnDelivered.backgroundColor = UIColor.clear
        //btnDelivered.titleLabel?.textColor = UIColor.darkGray
    }
    
    @IBAction func btnPickedUpAction(_ sender: Any) {
        btnAssigned.isSelected = false
        btnAssigned.backgroundColor = UIColor.clear
       // btnAssigned.titleLabel?.textColor = UIColor.darkGray
        btnPickedup.isSelected = true
        btnPickedup.backgroundColor = UIColor.darkGray
        //btnPickedup.titleLabel?.textColor = UIColor.white
        btnIntransit.isSelected = false
        btnIntransit.backgroundColor = UIColor.clear
       // btnIntransit.titleLabel?.textColor = UIColor.darkGray
        btnDelivered.isSelected = false
        btnDelivered.backgroundColor = UIColor.clear
        //btnDelivered.titleLabel?.textColor = UIColor.darkGray
    }
    
    @IBAction func btnIntransitAction(_ sender: Any) {
        btnAssigned.isSelected = false
        btnAssigned.backgroundColor = UIColor.clear
        //btnAssigned.titleLabel?.textColor = UIColor.darkGray
        btnPickedup.isSelected = false
        btnPickedup.backgroundColor = UIColor.clear
        //btnPickedup.titleLabel?.textColor = UIColor.darkGray
        btnIntransit.isSelected = true
        btnIntransit.backgroundColor = UIColor.darkGray
        //btnIntransit.titleLabel?.textColor = UIColor.white
        btnDelivered.isSelected = false
        btnDelivered.backgroundColor = UIColor.clear
        //btnDelivered.titleLabel?.textColor = UIColor.darkGray
    }
    
    @IBAction func btnDeliveredAction(_ sender: Any) {
        btnAssigned.isSelected = false
        btnAssigned.backgroundColor = UIColor.clear
        //btnAssigned.titleLabel?.textColor = UIColor.darkGray
        btnPickedup.isSelected = false
        btnPickedup.backgroundColor = UIColor.clear
        //btnPickedup.titleLabel?.textColor = UIColor.darkGray
        btnIntransit.isSelected = false
        btnIntransit.backgroundColor = UIColor.clear
       // btnIntransit.titleLabel?.textColor = UIColor.darkGray
        btnDelivered.isSelected = true
        btnDelivered.backgroundColor = UIColor.darkGray
       // btnDelivered.titleLabel?.textColor = UIColor.white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func navigationBtn(sender: UIButton){
        let buttonTag1 = sender.tag
        
        

    }
    @objc func btnPhone(sender: UIButton){
        let buttonTag1 = sender.tag
        
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell") as!TaskTableViewCell
        cell.btnNanigation.tag = indexPath.row
        cell.btnPhone.tag = indexPath.row
        cell.btnNanigation.addTarget(self, action: #selector(navigationBtn), for: .touchUpInside)
        cell.btnPhone.addTarget(self, action: #selector(btnPhone), for: .touchUpInside)
        return cell
    }

   
}
