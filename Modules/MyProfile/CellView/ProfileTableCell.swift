//
//  ProfileTableCell.swift
//  DeliveryApp
//
//  Created by Sayanti on 7/25/18.
//  Copyright © 2018 Aradhana Ray. All rights reserved.
//

import UIKit

class ProfileTableCell: UITableViewCell {

    @IBOutlet var profileNameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func cellDetails(dataDetails : ProfileModel , indexPathDetails: Int){
        
        switch indexPathDetails {
        case 0:
            profileNameLbl.text = dataDetails.profileName
        case 1:
            profileNameLbl.text = dataDetails.profileTitle
        case 2:
            profileNameLbl.text = dataDetails.profileEmail
        case 3:
            profileNameLbl.text = dataDetails.profileNumber
        case 4:
            profileNameLbl.text = dataDetails.profileUserName
        default:
            break
        }
    }
}
