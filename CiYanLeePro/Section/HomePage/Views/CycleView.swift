//
//  CycleView.swift
//  CiYanLeePro
//
//  Created by leo on 16/5/27.
//  Copyright © 2016年 leo. All rights reserved.
//

import UIKit

let TimeInterval = 2.0  // 全局的时间间隔
class CycleView: UIView, UIScrollViewDelegate{

    var contentScrollView: UIScrollView!
    
    var imageArray: [UIImage!]!{
        // 监听图片数组的变化, 如果有变化立即刷新轮转图中显示的图片
        willSet(newValue){
            self.imageArray = newValue
        }
        /**
         *  如果数据源改变, 则需要改变scrollview 分页指示器的数量
         */
        didSet{
            contentScrollView.scrollEnabled = !(imageArray.count == 1)
            self.pageIndicator.frame = CGRectMake(width - 20 * CGFloat(imageArray.count), height - 30, 20 * CGFloat(imageArray.count), 20)
            self.pageIndicator?.numberOfPages = self.imageArray.count
        }
        
    }
    
    
    var urlImageArray: [String]? {
        willSet(newValue){
            self.urlImageArray = newValue
        }
        
        didSet {
            // 这里用了强制拆包, 所以不要把urlImageArray设置为nil
            for urlStr in self.urlImageArray! {
                let urlImage = NSURL(string: urlStr)
                if urlImage == nil {break}
                let dataImage = NSData(contentsOfURL: urlImage!)
                if dataImage == nil{break}
                let tempImage = UIImage(data: dataImage!)
                if tempImage == nil {break}
                imageArray.append(tempImage)
            }
        }
    }
    
    var delegate: CirCleViewDelegate?
    
    var indexOfCurrentImage: Int! {
        // 监听显示的第几张图片, 来更新分页指示器
        didSet {
            self.pageIndicator.currentPage = indexOfCurrentImage
        }
    }
    
    var currentImageView: UIImageView!
    var lastImageView:    UIImageView!
    var nextImageView:    UIImageView!
    var pageIndicator:    UIPageControl!  // 页数指示器
    var timer:            NSTimer? // 计时器
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect, imageArray:[UIImage!]?) {
        self.init(frame: frame)
        self.imageArray = imageArray
        // 默认显示第一张
        self.indexOfCurrentImage = 0
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpCircleView() {
        self.contentScrollView = UIScrollView(frame: CGRectMake(0,0, width, height))
        contentScrollView.contentSize = CGSizeMake(width * CGFloat(self.imageArray.count), 0)
        contentScrollView.delegate = self
        contentScrollView.bounces = false
        contentScrollView.pagingEnabled = true
        contentScrollView.showsVerticalScrollIndicator = false
        contentScrollView.scrollEnabled = !(imageArray.count == 1)
        self.addSubview(contentScrollView)
        
        self.currentImageView = UIImageView()
        currentImageView.frame = CGRectMake(width, 0, width, 200)
        currentImageView.userInteractionEnabled = true
        currentImageView.contentMode = UIViewContentMode.ScaleToFill
        currentImageView.clipsToBounds = true
        contentScrollView.addSubview(currentImageView)
        // 添加点击事件
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(CycleView.imageTapAction(_:)))
        currentImageView.addGestureRecognizer(imageTap)
        
        self.lastImageView = UIImageView()
        lastImageView.frame = CGRectMake(0, 0, width, 200)
        lastImageView.contentMode = UIViewContentMode.ScaleToFill
        lastImageView.clipsToBounds = true
        contentScrollView.addSubview(lastImageView)
        
        self.nextImageView = UIImageView()
//        nextImageView.frame = CGRectMake(<#T##x: CGFloat##CGFloat#>, <#T##y: CGFloat##CGFloat#>, <#T##width: CGFloat##CGFloat#>, <#T##height: CGFloat##CGFloat#>)
        
    }
    
    
    
    
    // MARK: - Public Methods 
    func imageTapAction(tap: UITapGestureRecognizer){
        self.delegate?.clickCurrentImage!(indexOfCurrentImage)
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

@objc protocol CirCleViewDelegate {
    /**
     *  点击图片的代理方法
     *
     *  @para  currentIndex  当前点击图片的下标
     */
    
    optional func clickCurrentImage(currentIndex: Int)
    
}






