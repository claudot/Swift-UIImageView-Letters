//  Created by Paul-Anatole CLAUDOT on 12/02/2017.
//  Copyright © 2017 PAC. All rights reserved.
//

import UIKit

final class LetterTableViewCell: UITableViewCell {
    @IBOutlet weak var userImageView: UIImageView?
    @IBOutlet weak var userLabel: UILabel?

    func configure(name: String) {
        userLabel?.text = name
        userImageView?.setImage(string: name, color: UIColor.colorHash(name: name), circular: true)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        userImageView?.image = nil
        userLabel?.text = nil
    }
}
