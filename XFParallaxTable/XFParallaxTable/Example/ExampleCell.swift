//
//  ExampleCell.swift
//  XFParallaxTable
//
//  Created by 张广路 on 2019/4/18.
//  Copyright © 2019 symbool. All rights reserved.
//

import UIKit

let ExampleTableViewCellReuseIdentifier = "ExampleTableViewCellReuseIdentifier"
class ExampleCell: ParallaxTableViewCell {

    @IBOutlet weak var parH: NSLayoutConstraint!
    
    var title: String?
    var parallaxImageName: String?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        parH.constant = 500
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: USER ADD FUNC
    func config() {
        
        if let name = parallaxImageName, let bg = bgView as? UIImageView {
            bg.image = UIImage.init(named: name )
            bg.isHidden = false
        } else {
            bgView?.isHidden = true
        }
        if let t = title, let fg = fgView as? UILabel {
            fg.text = t
            fg.isHidden = false
        }else {
            fgView?.isHidden = true
        }
    }
}
