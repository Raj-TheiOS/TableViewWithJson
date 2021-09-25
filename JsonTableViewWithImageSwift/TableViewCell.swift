//
//  TableViewCell.swift
//  JsonTableViewWithImageSwift
//
//  Created by Raj on 21/06/17.
//  Copyright © 2017 Raj. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelTeam: UILabel!
    @IBOutlet weak var lblRealName: UILabel!
    @IBOutlet weak var lblfirstappearance: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
