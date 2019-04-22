//
//  ParallaxTableViewCell.swift
//  XFParallaxTable
//
//  Created by 张广路 on 2019/4/12.
//  Copyright © 2019 symbool. All rights reserved.
//

import UIKit

class ParallaxTableViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView?
    @IBOutlet weak var fgView:UIView?
    
    var settings: ParallaxSettings?
    
    // MARK: SYMTEM ADD FUNC
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        settings = ParallaxSettings.init()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    class func tableView(didScroll tableView: UITableView ) {
        for case let cell as ParallaxTableViewCell in tableView.visibleCells {
            guard cell.settings?.type == .parallax else {
                continue
            }
            
            let cellY = cell.frame.origin.y
            let tableH = tableView.frame.size.height
            let scrollY = cellY > tableH ? tableView.contentOffset.y - (cellY - tableH) : tableView.contentOffset.y
            
            cell.moveOffsetY(scrollY: scrollY)
        }
    }
    
    func moveOffsetY(scrollY y: CGFloat) {
        if let bg = bgView {
            let s = settings ?? ParallaxSettings.init(type:.parallax)
            let maxY = s.scrollMaxY
            var rate: CGFloat
            if s.rate > 0.0 && s.rate < 1.0 {
                rate = s.rate
            } else {
                rate = s.offsetMaxY/maxY
            }
            bg.transform = CGAffineTransform.init(translationX: 0, y: y * rate)
        }
    }
}

enum XFParallaxCellType {
    case normal
    case parallax
}

struct ParallaxSettings {
    var rate: CGFloat = -1.0
    var offsetMaxY: CGFloat = 100.0  //bg View 最大偏移量
    var type: XFParallaxCellType = .normal
    var scrollMaxY: CGFloat = UIScreen.main.bounds.height//cell 从刚开始进入到划出屏幕移动的距离 screen height + cell height
    init() {
        self.type = .normal
        self.rate = -1.0
        self.offsetMaxY = 100.0
        self.scrollMaxY = UIScreen.main.bounds.height
    }
    
    init(type: XFParallaxCellType, rate: CGFloat = -1.0, offsetMaxY: CGFloat = 100.0, scrollMaxY: CGFloat = UIScreen.main.bounds.height) {
        self.type = type
        self.rate = rate
        self.offsetMaxY = offsetMaxY
        self.scrollMaxY = scrollMaxY
    }
}
