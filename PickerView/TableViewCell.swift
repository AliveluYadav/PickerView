//
//  TableViewCell.swift
//  PickerView
//
//  Created by Alivelu Ravula on 4/12/18.
//  Copyright © 2018 Alivelu Ravula. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var getLbl1: UILabel!
    @IBOutlet weak var getLbl2: UILabel!
    @IBOutlet weak var getImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
