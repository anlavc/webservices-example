//
//  HomeTableViewCell.swift
//  json-webservis-learning
//
//  Created by Anıl AVCI on 16.07.2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
