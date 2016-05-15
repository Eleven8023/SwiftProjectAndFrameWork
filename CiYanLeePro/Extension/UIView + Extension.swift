
//
//  UIView + Extension.swift
//  CiYanLeePro
//
//  Created by leo on 16/5/15.
//  Copyright © 2016年 leo. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    var x: CGFloat{
        return self.frame.origin.x
    }
    var y:CGFloat{
        return self.frame.origin.y
    }
    var width:CGFloat{
        return self.frame.size.width
    }
    var height:CGFloat{
        return self.frame.size.height
    }
    var point:CGPoint{
        return self.frame.origin
    }
    
}

