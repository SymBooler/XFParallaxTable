//
//  XFParallaxTableModel.swift
//  XFParallaxTable
//
//  Created by 张广路 on 2019/4/12.
//  Copyright © 2019 symbool. All rights reserved.
//

import Foundation
import CoreGraphics

class ExampleModel: NSObject {
    
    var imageNames: Array<Any>? = Array()
    var cellHeights: [CGFloat]? = []
    var titles = [String]()
    
    
    var itemCount: Int {
        get {
            return cellHeights?.count ?? 0
        }
    }
    class func defaultParallaxModel() {
    }
}
extension ExampleModel{
    convenience init(createDefaultModel needDefault: Bool) {
        self.init()
        if needDefault {
            for i in 1...30 {
                if i % 3 == 0 {
                    imageNames?.append("Image-\(i/3)")
                    cellHeights?.append(400.0)
                } else {
                    imageNames?.append(-1)
                    cellHeights?.append(100.0)
                }
                titles.append("Item Index - \(i), Descriptions:> >  >")
            }
        }
        print(self.imageNames ?? "contains no image name")
        print(self.cellHeights ?? "contains no cell height")
    }
}
