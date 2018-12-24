//
//  TransportTypeCell.swift
//  DeliveryApp
//
//  Created by Sayanti on 7/25/18.
//  Copyright © 2018 Aradhana Ray. All rights reserved.
//

import UIKit

class TransportTypeCell: UICollectionViewCell {
    @IBOutlet var transportTypeView: UIView!
    @IBOutlet var transportTypeImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.transportTypeView.layer.cornerRadius = 5
    }
}
