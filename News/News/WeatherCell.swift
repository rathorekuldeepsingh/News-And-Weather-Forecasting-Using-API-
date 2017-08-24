//  Created by kuldeep singh on 7/6/17.
//  Copyright © 2017 kuldeep singh. All rights reserved.


import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet var lblSummary: UILabel!
    @IBOutlet var lblTemperature: UILabel!
    @IBOutlet var icon: UIImageView!

    
    
    
    
    
    
    
    override func awakeFromNib() {

        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
  }

}
