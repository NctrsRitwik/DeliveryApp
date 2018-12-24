//
//  MessageDetailViewController.swift
//  DeliveryApp
//
//  Created by Amit Chakraborty on 27/07/2018.
//  Copyright © 2018 Aradhana Ray. All rights reserved.
//

import UIKit

class MessageDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    

    @IBOutlet weak var tblmsgDtl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "LeftTableViewCell", bundle: Bundle.main)
        tblmsgDtl.register(nib, forCellReuseIdentifier: "LeftTableViewCell")
        let nib1 = UINib(nibName: "RightTableViewCell", bundle: Bundle.main)
        tblmsgDtl.register(nib1, forCellReuseIdentifier: "RightTableViewCell")
        // Do any additional setup after loading the view.
        tblmsgDtl.estimatedRowHeight = 100
        tblmsgDtl.rowHeight = UITableViewAutomaticDimension
    }

    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "LeftTableViewCell") as! LeftTableViewCell
            return cell
            
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "RightTableViewCell") as! RightTableViewCell
            return cell
            
        }
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
