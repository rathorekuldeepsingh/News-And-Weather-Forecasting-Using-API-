//  Created by kuldeep singh on 6/29/17.

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet var lblWebSource: UILabel!
    @IBOutlet var lblUrl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       }

}
