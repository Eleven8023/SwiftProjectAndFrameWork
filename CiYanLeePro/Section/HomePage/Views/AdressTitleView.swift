//
//  AdressTitleView.swift
//  CiYanLeePro
//
//  Created by leo on 16/5/23.
//  Copyright © 2016年 leo. All rights reserved.
//

import UIKit

class AdressTitleView: UIView {
    
    private let playLabel = UILabel()
    private let titleLabel = UILabel()
    private let arrowImage = UIImageView(image:UIImage(named:""))
    
    var adressWidth:CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayoutSubViews()
    }
    
    private func setLayoutSubViews(){
        
        playLabel.text = "配送至";
        playLabel.textColor = UIColor.blackColor()
        playLabel.backgroundColor = UIColor.clearColor()
        playLabel.layer.borderWidth = 0.5
        playLabel.layer.borderColor = UIColor.blackColor().CGColor
        playLabel.font = UIFont.systemFontOfSize(10)
        playLabel.sizeToFit()
        playLabel.textAlignment = NSTextAlignment.Center
        playLabel.frame = CGRectMake(0, (frame.size.height - playLabel.height - 2) * 0.5, playLabel.frame.size.width + 6, playLabel.frame.size.height + 2);
        addSubview(playLabel)
        
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.font = UIFont.systemFontOfSize(15)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
