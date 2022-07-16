//
//  DetailTableViewCell.swift
//  json-webservis-learning
//
//  Created by Anıl AVCI on 17.07.2022.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var email: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
