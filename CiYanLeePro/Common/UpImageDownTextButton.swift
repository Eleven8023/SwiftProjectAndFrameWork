//
//  UpImageDownTextButton.swift
//  CiYanLeePro
//
//  Created by leo on 16/5/20.
//  Copyright © 2016年 leo. All rights reserved.
//

import Foundation
import UIKit

class UpImageDownTextButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel?.sizeToFit()
        titleLabel?.frame = CGRectMake(0, height - 15, width, (titleLabel?.height)!)
        titleLabel?.textAlignment = .Center
        
        imageView?.frame = CGRectMake(0, 0, width, height - 15)
        imageView?.contentMode = UIViewContentMode.Center
    }
}

class ItemLeftButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        let Offset: CGFloat = 15
        
        titleLabel?.sizeToFit()
        titleLabel?.frame = CGRectMake(-Offset, height - 15, width - Offset, (titleLabel?.height)!)
        titleLabel?.textAlignment = .Center
        
        imageView?.frame = CGRectMake(-Offset, 0, width - Offset, height - 15)
        imageView?.contentMode = UIViewContentMode.Center
    }
}

class ItemRightButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let Offset: CGFloat = 15
        
        titleLabel?.sizeToFit()
        titleLabel?.frame = CGRectMake(Offset, height - 15, width + Offset, (titleLabel?.height)!)
        titleLabel?.textAlignment = .Center
        
        imageView?.frame = CGRectMake(Offset, 0, width + Offset, height - 15)
        imageView?.contentMode = UIViewContentMode.Center
        
    }
}

class ItemLeftImageButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView?.frame = bounds
        imageView?.frame.origin.x = -15
    }
}

