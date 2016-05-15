//
//  GuideCollectionViewCell.swift
//  CiYanLeePro
//
//  Created by leo on 16/5/15.
//  Copyright © 2016年 leo. All rights reserved.
//

import UIKit

class GuideCollectionViewCell: UICollectionViewCell {
    
    private let newsImageView = UIImageView(frame: ScreenBounds)
    private let nextButton = UIButton(frame: CGRectMake((ScreenWidth - 100) * 0.5, ScreenHeight - 110, 100, 33))
    
    var  newImage: UIImage? {
        didSet{
            newsImageView.image = newImage
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        newsImageView.contentMode = UIViewContentMode.ScaleAspectFill
        contentView.addSubview(newsImageView)
        
        nextButton.setBackgroundImage(UIImage(named: "icon_next"), forState: UIControlState.Normal)
        nextButton.addTarget(self, action: #selector(self.nextButtonClick), forControlEvents: UIControlEvents.TouchUpInside)
        nextButton.hidden = true
        contentView.addSubview(nextButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setNextButtonHidden(hidden:Bool){
        nextButton.hidden = hidden
    }
    
    func nextButtonClick(){
        NSNotificationCenter.defaultCenter().postNotificationName(GuideViewControllerDidFinish, object: nil)
    }
    
    
}
