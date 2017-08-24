//
//  NewsFeedCell.swift
//  News
//
//  Created by kuldeep singh on 6/29/17.
//  Copyright © 2017 kuldeep singh. All rights reserved.
//

import UIKit

class NewsFeedCell: UITableViewCell {

    @IBOutlet var newsImage: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDescription: UILabel!
    @IBOutlet var lblUrl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
