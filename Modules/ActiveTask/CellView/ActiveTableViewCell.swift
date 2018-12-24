//
//  ActiveTableViewCell.swift
//  DeliveryApp
//
//  Created by Amit Chakraborty on 25/07/2018.
//  Copyright © 2018 Aradhana Ray. All rights reserved.
//

import UIKit

class ActiveTableViewCell: UITableViewCell {

    @IBOutlet weak var viewParent: UIView!
    
    @IBOutlet weak var viewSub: UIView!
    @IBOutlet weak var viewLocation: UIView!
    
    @IBOutlet weak var lbldropPosition: UILabel!
    @IBOutlet weak var viewUserDetail: UIView!
    @IBOutlet weak var lblPickUpCenter: UILabel!
    
    @IBOutlet weak var lblUserDlvrTime: UILabel!
    @IBOutlet weak var lblUserAddress: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    
    @IBOutlet weak var lblAssigned: UILabel!
    @IBOutlet weak var btnPhone: UIButton!
    
    @IBOutlet weak var btndelvr: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewSub.layer.cornerRadius = 7.0
        viewSub.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
