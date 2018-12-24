//
//  ExpandableHeaderTVCell.swift
//  LiveSell
//
//  Created by Dipanjan on 6/6/18.
//  Copyright © 2018 Aradhana Ray. All rights reserved.
//

import UIKit

class ExpandableHeaderTVCell: UITableViewCell {

    @IBOutlet weak var imgvwExpansionIndicator: UIImageView!
    @IBOutlet weak var imgvwSctionImage: UIImageView!
    @IBOutlet weak var lblSectionName: UILabel!
    @IBOutlet weak var btnExpandOutlet: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
