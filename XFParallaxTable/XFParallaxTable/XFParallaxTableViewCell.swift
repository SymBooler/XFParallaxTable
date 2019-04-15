//
//  XFParallaxTableViewCell.swift
//  XFParallaxTable
//
//  Created by 张广路 on 2019/4/12.
//  Copyright © 2019 symbool. All rights reserved.
//

import UIKit

let XFParallaxTableViewCellReuseIdentifier = "XFParallaxTableViewCellReuseIdentifier"


class XFParallaxTableViewCell: UITableViewCell {

    @IBOutlet weak var parallaxView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    var parallaxImageName: Any?
    var title: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config() {
        if let name = parallaxImageName as? String {
            parallaxView.image = UIImage.init(named: name)
            parallaxView.isHidden = false
        } else {
            parallaxView.isHidden = true
        }
        if let noneTitle = title {
            titleLabel.text = noneTitle
            titleLabel.isHidden = false
        }else {
            titleLabel.isHidden = true
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

enum XFParallaxCellSubtype {
    case background
    case foreground
}
