//  Created by kuldeep singh on 7/6/17.
//  Copyright © 2017 kuldeep singh. All rights reserved.

import UIKit

class favoriteCell: UITableViewCell {

    @IBOutlet var favoriteImage: UIImageView!
    @IBOutlet var lblFavoriteTitle: UILabel!
    @IBOutlet var lblFavoriteDescription: UILabel!

   override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
